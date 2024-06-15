import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../x_flutter.dart';

enum XButtonSize { small, medium, large } // 按钮大小

enum XButtonType { primary, danger, warning, success, info } // 按钮类型

enum XButtonShape { square, round, circle, radius } // 按钮形状

enum XButtonStatus { defaultState, active, disable }

typedef XButtonEvent = void Function();

class XButton extends StatefulWidget {
  const XButton({
    super.key,
    this.text,
    this.child,
    this.type = XButtonType.primary,
    this.size = XButtonSize.medium,
    this.width,
    this.height,
    this.icon,
    this.iconWidget,
    this.style,
    this.margin,
    this.padding,
    this.shape = XButtonShape.radius,
    this.loading = false,
    this.disabled = false,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onDoubleTapDown,
    this.onTapDown,
    this.onTapUp,
  });

  final String? text; // 文本
  final XButtonType type; // 类型
  final XButtonSize size; // 大小
  final double? width;
  final double? height;
  final bool loading; // 加载中
  final bool disabled; // 禁用
  final XButtonStyle? style;
  final XButtonShape? shape;
  final IconData? icon; //  图标
  final EdgeInsetsGeometry? padding; // 内边距
  final EdgeInsetsGeometry? margin; // 外边距

  final Widget? iconWidget; // 自定义图标icon控件
  final Widget? child; // 子控件

  final XButtonEvent? onTap; // 点击事件
  final XButtonEvent? onDoubleTap; // 双击事件
  final XButtonEvent? onDoubleTapDown; // 双击按下事件
  final XButtonEvent? onLongPress; // 长按事件
  final XButtonEvent? onTapDown; // 按下事件
  final XButtonEvent? onTapUp; // 抬起事件
  @override
  State<StatefulWidget> createState() => _XButtonState();
}

class _XButtonState extends State<XButton> {
  double? _width;
  double? _height;
  double? _iconSize;
  Alignment? _alignment;

  XButtonStatus _status = XButtonStatus.defaultState;

  EdgeInsetsGeometry? _padding;
  EdgeInsetsGeometry? _margin;
  XButtonStyle? _style;
  XButtonStyle? _defaultStyle;
  TextStyle? _textStyle;
  @override
  void initState() {
    super.initState();
    _updateParams();
  }

  _updateParams() async {
    _status = widget.disabled ? XButtonStatus.disable : XButtonStatus.defaultState;
    _defaultStyle = _generateDefaultStyle();
    _iconSize = _getIconSize();
    _padding = _getPadding();
    _margin = _getMargin();
    _style = _generateStyle();
    _alignment = Alignment.center;
    if (widget.text != null) {
      _textStyle = _getTextStyle();
    }
    _width = _getButtonWidth();
    _height = _getButtonHeight();
  }

  @override
  void didUpdateWidget(covariant XButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateParams();
  }

  @override
  Widget build(BuildContext context) {
    Widget display = Container(
      width: _width,
      height: _height,
      alignment: _alignment,
      padding: _padding,
      margin: _margin,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        border: _getBorder(context),
        borderRadius: style.radius ?? BorderRadius.all(_getRadius()),
      ),
      child: widget.child ?? _getChild(),
    );
    if (widget.disabled) {
      return display;
    }
    return GestureDetector(
      onTap: () {
        if (!widget.disabled && widget.onTap != null) widget.onTap!();
      },
      onDoubleTap: () {
        if (!widget.disabled && widget.onDoubleTap != null) widget.onDoubleTap!();
      },
      // onLongPress: () {
      //   if (!widget.disabled && widget.onLongPress != null) widget.onLongPress!();
      // },
      onTapDown: (TapDownDetails details) {
        if (widget.disabled) return;
        setState(() {
          _status = XButtonStatus.active;
        });
      },
      onTapUp: (TapUpDetails details) {
        if (widget.disabled) return;

        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) {
            setState(() {
              _status = XButtonStatus.defaultState;
            });
          }
        });
      },
      child: display,
    );
  }

  EdgeInsetsGeometry? _getPadding() {
    if (widget.padding != null) {
      return widget.padding;
    }
    var equalSide = widget.shape == XButtonShape.radius || widget.shape == XButtonShape.circle;

    double horizontalPadding;
    double verticalPadding;
    switch (widget.size) {
      case XButtonSize.large:
        horizontalPadding = equalSide ? 12 : 20;
        verticalPadding = 12;
        break;
      case XButtonSize.medium:
        horizontalPadding = equalSide ? 10 : 16;
        verticalPadding = equalSide ? 10 : 8;
        break;
      case XButtonSize.small:
        horizontalPadding = equalSide ? 7 : 12;
        verticalPadding = equalSide ? 7 : 5;
        break;
    }
    if (style.borderWidth != null && style.borderWidth != 0) {
      horizontalPadding = horizontalPadding - style.borderWidth!;
      verticalPadding = verticalPadding - style.borderWidth!;
      if (horizontalPadding < 0) {
        horizontalPadding = 0;
      }
      if (verticalPadding < 0) {
        verticalPadding = 0;
      }
    }
    return EdgeInsets.only(left: horizontalPadding, right: horizontalPadding, bottom: verticalPadding, top: verticalPadding);
  }

  EdgeInsetsGeometry? _getMargin() {
    if (widget.margin != null) {
      return widget.margin;
    }
    return null;
  }

  Widget? getIcon() {
    if (widget.loading) {
      return const Icon(XIcon.loading);
    }
    if (widget.iconWidget != null) {
      return widget.iconWidget;
    }
    if (widget.icon != null) {
      return RichText(
        overflow: TextOverflow.visible,
        text: TextSpan(
          text: String.fromCharCode(widget.icon!.codePoint),
          style: TextStyle(
            inherit: false,
            height: 1,
            fontSize: _iconSize,
            fontFamily: widget.icon!.fontFamily,
            package: widget.icon!.fontPackage,
          ),
        ),
      );
    }
    return null;
  }

  double _getButtonHeight() {
    if (widget.height != null) {
      return widget.height!;
    }
    switch (widget.size) {
      case XButtonSize.large:
        return 48;
      case XButtonSize.medium:
        return 40;
      case XButtonSize.small:
        return 32;
    }
  }

  double _getButtonWidth() {
    if (widget.width != null) {
      return widget.width!;
    }
    switch (widget.size) {
      case XButtonSize.small:
        return 80;
      case XButtonSize.medium:
        return 120;
      case XButtonSize.large:
        return 160;
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case XButtonSize.large:
        return 24;
      case XButtonSize.medium:
        return 22;
      case XButtonSize.small:
        return 20;
    }
  }

  Widget _getChild() {
    var icon = getIcon();
    if (widget.text == null && icon == null) {
      return Container();
    }
    var children = <Widget>[];

    if (icon != null) {
      children.add(icon);
    }
    if (widget.text != null) {
      children.add(Text(
        widget.text!,
        style: _textStyle,
      ));
    }

    if (children.length == 2) {
      children.insert(
        1,
        const SizedBox(
          width: 8,
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Border? _getBorder(BuildContext context) {
    if (style.borderWidth != null && style.borderWidth != 0) {
      return Border.all(
        color: style.borderColor ?? XTheme.of(context).grayColor3,
        width: style.borderWidth!,
      );
    }
    return null;
  }

  Radius _getRadius() {
    switch (widget.shape) {
      case XButtonShape.radius:
        switch (widget.size) {
          case XButtonSize.large:
            return Radius.circular(XTheme.of(context).radiusLarge);
          case XButtonSize.medium:
            return Radius.circular(XTheme.of(context).radiusDefault);
          case XButtonSize.small:
            return Radius.circular(XTheme.of(context).radiusSmall);
        }
      case XButtonShape.circle:
      case XButtonShape.round:
        return Radius.circular(XTheme.of(context).radiusRound);
      case XButtonShape.square:
      default:
        return Radius.zero;
    }
  }

  XButtonStyle get style {
    switch (_status) {
      case XButtonStatus.defaultState:
      case XButtonStatus.active:
      case XButtonStatus.disable:
        return XButtonStyle.generateStyle(context, widget.type, _status);
      default:
        return _style ?? _defaultStyle!;
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case XButtonSize.large:
        return 16;
      case XButtonSize.medium:
        return 14;
      case XButtonSize.small:
        return 12;
    }
  }

  TextStyle _getTextStyle() {
    return TextStyle(color: style.textColor, fontSize: _getFontSize());
  }

  XButtonStyle _generateStyle() {
    return XButtonStyle.generateStyle(context, widget.type, _status);
  }

  XButtonStyle _generateDefaultStyle() {
    return XButtonStyle.generateDefaultStyle(context);
  }
}
