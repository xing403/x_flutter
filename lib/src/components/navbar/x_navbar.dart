import 'package:flutter/material.dart';
import '../../../x_flutter.dart';

typedef XBarItemAction = void Function();

class XNavBar extends StatefulWidget implements PreferredSizeWidget {
  const XNavBar({
    super.key,
    this.leftBarItems,
    this.rightBarItems,
    this.titleWidget,
    this.title,
    this.titleColor,
    this.titleFont,
    this.titleFontWeight = FontWeight.w500,
    this.centerTitle = true,
    this.opacity = 1.0,
    this.backgroundColor,
    this.titleMargin = 16,
    this.padding,
    this.height = 44,
    this.screenAdaptation = true,
    this.useDefaultBack = true,
    this.onBack,
    this.useBorderStyle = false,
    this.border,
    this.belowTitleWidget,
  });

  /// 左边操作项
  final List<XNavBarItem>? leftBarItems;

  /// 右边操作项
  final List<XNavBarItem>? rightBarItems;

  /// 标题控件
  final Widget? titleWidget;

  /// 标题
  final String? title;

  /// 标题颜色
  final Color? titleColor;

  /// 标题字体尺寸
  final Font? titleFont;

  /// 标题字体粗细
  final FontWeight? titleFontWeight;

  /// 标题是否居中
  final bool centerTitle;

  /// 透明度
  final double opacity;

  /// 背景颜色
  final Color? backgroundColor;

  /// 内部填充
  final EdgeInsetsGeometry? padding;

  /// 中间文案左右两边间距
  final double titleMargin;

  /// 高度
  final double height;

  /// 是否进行屏幕适配，默认true
  final bool screenAdaptation;

  /// 是否使用默认的返回
  final bool useDefaultBack;

  /// 返回事件
  final VoidCallback? onBack;

  /// 是否使用边框模式
  final bool useBorderStyle;

  /// 边框
  final XNavBarItemBorder? border;

  /// belowTitleWidget navbar 下方的widget
  final Widget? belowTitleWidget;

  @override
  State<StatefulWidget> createState() => _XNavBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _XNavBarState extends State<XNavBar> {
  Widget _addBorder(List<Widget> items) {
    var border = widget.border ?? XNavBarItemBorder();
    var borderColor = border.color ?? XTheme.of(context).baseBorderColor;
    var children = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      children.add(items[i]);
      if (widget.useBorderStyle && i != items.length - 1) {
        children.add(
          Container(
            width: border.width,
            height: 16.0,
            color: borderColor,
          ),
        );
      }
    }
    var child = Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border.radius),
        border: Border.all(
          color: borderColor,
          width: border.width,
        ),
      ),
      padding: border.padding ?? const EdgeInsets.symmetric(horizontal: 10),
      child: child,
    );
  }

  Widget get backButton {
    return XNavBarItem(
      icon: Icons.chevron_left,
      iconColor: widget.titleColor ?? XTheme.of(context).baseWhiteColor,
      action: () {
        widget.onBack?.call();
        Navigator.maybePop(context);
      },
    ).toWidget(context);
  }

  Widget _buildTitleBarItems(bool isLeft) {
    var barItems = (isLeft ? widget.leftBarItems : widget.rightBarItems) ?? [];
    var children =
        barItems.map((e) => e.toWidget(context, isLeft: isLeft)).toList();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isLeft && widget.useDefaultBack) backButton,
        if (children.isNotEmpty)
          widget.useBorderStyle
              ? _addBorder(children)
              : Row(mainAxisSize: MainAxisSize.min, children: children),
      ],
    );
  }

  TextStyle _getTitleStyle(BuildContext context) {
    return TextStyle(
      fontSize: (widget.titleFont ?? XTheme.of(context).fontBodyLarge)?.size,
      color: widget.titleColor ?? XTheme.of(context).baseWhiteColor,
      fontWeight: widget.titleFontWeight ?? FontWeight.w500,
      decoration: TextDecoration.none,
    );
  }

  Widget _getTitleWidget(BuildContext context) {
    return widget.titleWidget ??
        Text(
          widget.title ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: _getTitleStyle(context),
        );
  }

  Widget _getNavbarChild() {
    final Widget toolbar = NavigationToolbar(
      leading: _buildTitleBarItems(true),
      middle: _getTitleWidget(context),
      trailing: _buildTitleBarItems(false),
      middleSpacing: widget.titleMargin,
      centerMiddle: widget.centerTitle,
    );
    if (widget.belowTitleWidget == null) {
      return toolbar;
    }
    var children = <Widget>[Expanded(child: toolbar)];
    children.add(widget.belowTitleWidget as Widget);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    var bcc = widget.backgroundColor ?? XTheme.of(context).brandNormalColor;
    if (bcc != Colors.transparent) {
      bcc = bcc.withOpacity(widget.opacity);
    }

    var paddingTop =
        widget.screenAdaptation ? MediaQuery.of(context).padding.top : 0.0;
    var padding = widget.padding ??
        const EdgeInsets.symmetric(horizontal: 16, vertical: 4);

    return Container(
      color: bcc,
      height: widget.height + paddingTop,
      padding: padding.add(EdgeInsets.only(top: paddingTop)),
      child: _getNavbarChild(),
    );
  }
}

class XNavBarItem {
  XNavBarItem({
    this.icon,
    this.iconColor,
    this.action,
    this.iconSize = 24.0,
    this.padding,
    this.iconWidget,
  });

  /// 图标
  IconData? icon;

  /// 图标颜色
  Color? iconColor;

  /// 操作回调
  XBarItemAction? action;

  /// 图标尺寸
  double? iconSize;

  /// 内部填充
  EdgeInsetsGeometry? padding;

  /// 图标组件
  Widget? iconWidget;

  Widget toWidget(BuildContext context, {bool isLeft = true}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: action,
        child: Padding(
          padding: padding ??
              (isLeft
                  ? const EdgeInsets.only(right: 8)
                  : const EdgeInsets.only(left: 8)),
          child: iconWidget ?? Icon(icon, size: iconSize, color: iconColor),
        ),
      );
}

class XNavBarItemBorder {
  double width;
  double radius;
  Color? color;
  EdgeInsetsGeometry? padding;

  XNavBarItemBorder({
    this.width = 1.0,
    this.radius = 22.0,
    this.color,
    this.padding,
  });
}
