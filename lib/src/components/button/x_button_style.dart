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
    bool isWhite = status == XButtonStatus.active || (plain == false && status == XButtonStatus.defaultState);
    switch (type) {
      case XButtonType.primary:
        textColor = XTheme.of(context).brandNormalColor;
        backgroundColor = _getBgPrimaryStyle(context, plain, status);
        break;
      case XButtonType.danger:
        textColor = XTheme.of(context).errorNormalColor;
        backgroundColor = _getBgDangerStyle(context, plain, status);
        break;
      case XButtonType.success:
        textColor = XTheme.of(context).successNormalColor;
        backgroundColor = _getBgSuccessStyle(context, plain, status);
        break;
      case XButtonType.warning:
        textColor = XTheme.of(context).warningNormalColor;
        backgroundColor = _getBgWarningStyle(context, plain, status);
        break;
      case XButtonType.info:
        textColor = XTheme.of(context).grayColor6;
        backgroundColor = _getBgInfoStyle(context, plain, status);
        break;
    }
    textColor = isWhite ? XTheme.of(context).baseWhiteColor : textColor;
    borderWidth = 1;
    borderColor = _getBorderStyle(context, type, status);
  }
  XButtonStyle.generateDefaultStyle(BuildContext context) {
    XButtonStyle.generateStyle(context, XButtonType.primary, false, XButtonStatus.active);
  }
  Color _getBorderStyle(BuildContext context, XButtonType type, XButtonStatus status) {
    if (status == XButtonStatus.active) {
      switch (type) {
        case XButtonType.primary:
          return XTheme.of(context).brandClickColor;
        case XButtonType.danger:
          return XTheme.of(context).errorClickColor;
        case XButtonType.warning:
          return XTheme.of(context).warningClickColor;
        case XButtonType.success:
          return XTheme.of(context).successClickColor;
        case XButtonType.info:
          return XTheme.of(context).grayColor7;
      }
    } else if (status == XButtonStatus.defaultState) {
      switch (type) {
        case XButtonType.primary:
          return XTheme.of(context).brandNormalColor;
        case XButtonType.danger:
          return XTheme.of(context).errorNormalColor;
        case XButtonType.warning:
          return XTheme.of(context).warningNormalColor;
        case XButtonType.success:
          return XTheme.of(context).successNormalColor;
        case XButtonType.info:
          return XTheme.of(context).grayColor6;
      }
    } else {
      switch (type) {
        case XButtonType.primary:
          return XTheme.of(context).brandDisabledColor;
        case XButtonType.danger:
          return XTheme.of(context).errorDisabledColor;
        case XButtonType.warning:
          return XTheme.of(context).warningDisabledColor;
        case XButtonType.success:
          return XTheme.of(context).successDisabledColor;
        case XButtonType.info:
          return XTheme.of(context).grayColor4;
      }
    }
  }

  Color _getBgPrimaryStyle(BuildContext context, bool plain, XButtonStatus status) {
    switch (status) {
      case XButtonStatus.defaultState:
        return plain ? XTheme.of(context).brandColor3 : XTheme.of(context).brandNormalColor;
      case XButtonStatus.active:
        return XTheme.of(context).brandClickColor;
      case XButtonStatus.disable:
        return plain ? XTheme.of(context).brandColor1 : XTheme.of(context).brandDisabledColor;
    }
  }

  Color _getBgDangerStyle(BuildContext context, bool plain, XButtonStatus status) {
    switch (status) {
      case XButtonStatus.defaultState:
        return plain ? XTheme.of(context).errorColor3 : XTheme.of(context).errorNormalColor;
      case XButtonStatus.active:
        return XTheme.of(context).errorClickColor;
      case XButtonStatus.disable:
        return plain ? XTheme.of(context).errorColor1 : XTheme.of(context).errorDisabledColor;
    }
  }

  Color _getBgWarningStyle(BuildContext context, bool plain, XButtonStatus status) {
    switch (status) {
      case XButtonStatus.defaultState:
        return plain ? XTheme.of(context).warningColor3 : XTheme.of(context).warningNormalColor;
      case XButtonStatus.active:
        return XTheme.of(context).warningClickColor;
      case XButtonStatus.disable:
        return plain ? XTheme.of(context).warningColor1 : XTheme.of(context).warningDisabledColor;
    }
  }

  Color _getBgSuccessStyle(BuildContext context, bool plain, XButtonStatus status) {
    switch (status) {
      case XButtonStatus.defaultState:
        return plain ? XTheme.of(context).successColor3 : XTheme.of(context).successNormalColor;
      case XButtonStatus.active:
        return XTheme.of(context).successClickColor;
      case XButtonStatus.disable:
        return plain ? XTheme.of(context).successColor1 : XTheme.of(context).successDisabledColor;
    }
  }

  Color _getBgInfoStyle(BuildContext context, bool plain, XButtonStatus status) {
    switch (status) {
      case XButtonStatus.defaultState:
        return plain ? XTheme.of(context).grayColor3 : XTheme.of(context).grayColor6;
      case XButtonStatus.active:
        return XTheme.of(context).grayColor7;
      case XButtonStatus.disable:
        return plain ? XTheme.of(context).grayColor1 : XTheme.of(context).grayColor1;
    }
  }
}
