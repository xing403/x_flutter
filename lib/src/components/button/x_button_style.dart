import 'package:flutter/material.dart';
import '../../../x_flutter.dart';

class XButtonStyle {
  XButtonStyle({this.backgroundColor, this.borderColor, this.textColor, this.borderWidth, this.radius});

  Color? backgroundColor; // 背景颜色

  Color? textColor; // 文字颜色

  Color? borderColor; // 边框颜色

  double? borderWidth; // 边框宽度

  BorderRadiusGeometry? radius; // 自定义圆角

  XButtonStyle.generateStyle(BuildContext context, XButtonType type, bool plain, XButtonStatus status) {
    textColor = XTheme.of(context).fontWhColor1;
    switch (type) {
      case XButtonType.primary:
        backgroundColor = _getBgPrimaryStyle(context, status);
        break;
      case XButtonType.danger:
        backgroundColor = _getBgDangerStyle(context, status);
        break;
      case XButtonType.success:
        backgroundColor = _getBgSuccessStyle(context, status);
        break;
      case XButtonType.warning:
        backgroundColor = _getBgWarningStyle(context, status);
        break;
      case XButtonType.info:
        backgroundColor = _getBgInfoStyle(context, status);
        break;
      default:
        backgroundColor = Colors.black.withOpacity(0.6);
    }

    borderWidth = 1;
    borderColor = backgroundColor;
    if (plain) {
      textColor = backgroundColor;
      backgroundColor = Colors.transparent;
    }
  }
  XButtonStyle.generateDefaultStyle(BuildContext context) {
    XButtonStyle.generateStyle(context, XButtonType.primary, false, XButtonStatus.active);
  }
  Color _getBgPrimaryStyle(BuildContext context, XButtonStatus status) {
    switch (status) {
      case XButtonStatus.defaultState:
        return XTheme.of(context).brandColor7;
      case XButtonStatus.active:
        return XTheme.of(context).brandColor4;
      case XButtonStatus.disable:
        return XTheme.of(context).brandColor3;
    }
  }

  Color _getBgDangerStyle(BuildContext context, XButtonStatus status) {
    switch (status) {
      case XButtonStatus.defaultState:
        return XTheme.of(context).errorColor7;
      case XButtonStatus.active:
        return XTheme.of(context).errorColor4;
      case XButtonStatus.disable:
        return XTheme.of(context).errorColor3;
    }
  }

  Color _getBgWarningStyle(BuildContext context, XButtonStatus status) {
    switch (status) {
      case XButtonStatus.defaultState:
        return XTheme.of(context).warningColor7;
      case XButtonStatus.active:
        return XTheme.of(context).warningColor4;
      case XButtonStatus.disable:
        return XTheme.of(context).warningColor3;
    }
  }

  Color _getBgSuccessStyle(BuildContext context, XButtonStatus status) {
    switch (status) {
      case XButtonStatus.defaultState:
        return XTheme.of(context).successColor7;
      case XButtonStatus.active:
        return XTheme.of(context).successColor4;
      case XButtonStatus.disable:
        return XTheme.of(context).successColor3;
    }
  }

  Color _getBgInfoStyle(BuildContext context, XButtonStatus status) {
    switch (status) {
      case XButtonStatus.defaultState:
        return XTheme.of(context).grayColor7;
      case XButtonStatus.active:
        return XTheme.of(context).grayColor4;
      case XButtonStatus.disable:
        return XTheme.of(context).grayColor3;
    }
  }
}
