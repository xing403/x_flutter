import 'dart:ui';

import 'package:flutter/material.dart';
import 'x_theme.dart';

extension XColors on XThemeData {
  Color get brandColor1 => colorMap['brandColor1'] ?? const Color(0xFFF2F3FF);
  Color get brandColor2 => colorMap['brandColor2'] ?? const Color(0xFFD9E1FF);
  Color get brandColor3 => colorMap['brandColor3'] ?? const Color(0xFFB5C7FF);
  Color get brandColor4 => colorMap['brandColor4'] ?? const Color(0xFF8EABFF);
  Color get brandColor5 => colorMap['brandColor5'] ?? const Color(0xFF618DFF);
  Color get brandColor6 => colorMap['brandColor6'] ?? const Color(0xFF366EF4);
  Color get brandColor7 => colorMap['brandColor7'] ?? const Color(0xFF0052D9);
  Color get brandColor8 => colorMap['brandColor8'] ?? const Color(0xFF003CAB);
  Color get brandColor9 => colorMap['brandColor9'] ?? const Color(0xFF002A7C);
  Color get brandColor10 => colorMap['brandColor10'] ?? const Color(0xFF001A57);
  Color get brandLightColor => colorMap['brandLightColor'] ?? brandColor1;
  Color get brandFocusColor => colorMap['brandFocusColor'] ?? brandColor2;
  Color get brandDisabledColor => colorMap['brandDisabledColor'] ?? brandColor3;
  Color get brandHoverColor => colorMap['brandHoverColor'] ?? brandColor6;
  Color get brandNormalColor => colorMap['brandNormalColor'] ?? brandColor7;
  Color get brandClickColor => colorMap['brandClickColor'] ?? brandColor8;

  /// 错误色组----------------------------------------------------

  ///#FFF0ED
  Color get errorColor1 => colorMap['errorColor1'] ?? const Color(0xFFFFF0ED);

  ///#FFD8D2
  Color get errorColor2 => colorMap['errorColor2'] ?? const Color(0xFFFFD8D2);

  ///#FFB9B0
  Color get errorColor3 => colorMap['errorColor3'] ?? const Color(0xFFFFB9B0);

  ///#FF9285
  Color get errorColor4 => colorMap['errorColor4'] ?? const Color(0xFFFF9285);

  ///#F6685D
  Color get errorColor5 => colorMap['errorColor5'] ?? const Color(0xFFF6685D);

  ///#D54941
  Color get errorColor6 => colorMap['errorColor6'] ?? const Color(0xFFD54941);

  ///#AD352F
  Color get errorColor7 => colorMap['errorColor7'] ?? const Color(0xFFAD352F);

  ///#881F1C
  Color get errorColor8 => colorMap['errorColor8'] ?? const Color(0xFF881F1C);

  ///#68070A
  Color get errorColor9 => colorMap['errorColor9'] ?? const Color(0xFF68070A);

  ///#490002
  Color get errorColor10 => colorMap['errorColor10'] ?? const Color(0xFF490002);

  ///#FFF0ED
  Color get errorLightColor => colorMap['errorLightColor'] ?? errorColor1;

  ///#FFD8D2
  Color get errorFocusColor => colorMap['errorFocusColor'] ?? errorColor2;

  ///#FFB9B0
  Color get errorDisabledColor => colorMap['errorDisabledColor'] ?? errorColor3;

  ///#F6685D
  Color get errorHoverColor => colorMap['errorHoverColor'] ?? errorColor5;

  ///#D54941
  Color get errorNormalColor => colorMap['errorNormalColor'] ?? errorColor6;

  ///#AD352F
  Color get errorClickColor => colorMap['errorClickColor'] ?? errorColor7;

  /// 警告色组----------------------------------------------------

  ///#FFF1E9
  Color get warningColor1 => colorMap['warningColor1'] ?? const Color(0xFFFFF1E9);

  ///#FFD9C2
  Color get warningColor2 => colorMap['warningColor2'] ?? const Color(0xFFFFD9C2);

  ///#FFB98C
  Color get warningColor3 => colorMap['warningColor3'] ?? const Color(0xFFFFB98C);

  ///#FA9550
  Color get warningColor4 => colorMap['warningColor4'] ?? const Color(0xFFFA9550);

  ///#E37318
  Color get warningColor5 => colorMap['warningColor5'] ?? const Color(0xFFE37318);

  ///#BE5A00
  Color get warningColor6 => colorMap['warningColor6'] ?? const Color(0xFFBE5A00);

  ///#954500
  Color get warningColor7 => colorMap['warningColor7'] ?? const Color(0xFF954500);

  ///#713300
  Color get warningColor8 => colorMap['warningColor8'] ?? const Color(0xFF713300);

  ///#532300
  Color get warningColor9 => colorMap['warningColor9'] ?? const Color(0xFF532300);

  ///#3B1700
  Color get warningColor10 => colorMap['warningColor10'] ?? const Color(0xFF3B1700);

  ///#FFF1E9
  Color get warningLightColor => colorMap['warningLightColor'] ?? warningColor1;

  ///#FFD9C2
  Color get warningFocusColor => colorMap['warningFocusColor'] ?? warningColor2;

  ///#FFB98C
  Color get warningDisabledColor => colorMap['warningDisabledColor'] ?? warningColor3;

  ///#FA9550
  Color get warningHoverColor => colorMap['warningHoverColor'] ?? warningColor4;

  Color get warningNormalColor => colorMap['warningNormalColor'] ?? warningColor5;

  Color get warningClickColor => colorMap['warningClickColor'] ?? warningColor6;

  /// 成功色组----------------------------------------------------

  Color get successColor1 => colorMap['successColor1'] ?? const Color(0xFFE3F9E9);

  Color get successColor2 => colorMap['successColor2'] ?? const Color(0xFFC6F3D7);

  Color get successColor3 => colorMap['successColor3'] ?? const Color(0xFF92DAB2);

  Color get successColor4 => colorMap['successColor4'] ?? const Color(0xFF56C08D);

  Color get successColor5 => colorMap['successColor5'] ?? const Color(0xFF2BA471);

  Color get successColor6 => colorMap['successColor6'] ?? const Color(0xFF008858);

  Color get successColor7 => colorMap['successColor7'] ?? const Color(0xFF006C45);

  Color get successColor8 => colorMap['successColor8'] ?? const Color(0xFF005334);

  Color get successColor9 => colorMap['successColor9'] ?? const Color(0xFF003B23);

  Color get successColor10 => colorMap['successColor10'] ?? const Color(0xFF002515);

  Color get successLightColor => colorMap['successLightColor'] ?? successColor1;

  Color get successFocusColor => colorMap['successFocusColor'] ?? successColor2;

  Color get successDisabledColor => colorMap['successDisabledColor'] ?? successColor3;

  Color get successHoverColor => colorMap['successHoverColor'] ?? successColor4;

  Color get successNormalColor => colorMap['successNormalColor'] ?? successColor5;

  Color get successClickColor => colorMap['successClickColor'] ?? successColor6;

  Color get fontGyColor1 => colorMap['fontGyColor1'] ?? const Color(0xE6000000);

  Color get fontGyColor2 => colorMap['fontGyColor2'] ?? const Color(0x99000000);

  Color get fontGyColor3 => colorMap['fontGyColor3'] ?? const Color(0x66000000);

  Color get fontGyColor4 => colorMap['fontGyColor4'] ?? const Color(0x42000000);
  Color get fontWhColor1 => colorMap['fontWhColor1'] ?? const Color(0xFFFFFFFF);
  Color get fontWhColor2 => colorMap['fontWhColor2'] ?? const Color(0x8CFFFFFF);

  Color get fontWhColor3 => colorMap['fontWhColor3'] ?? const Color(0x59FFFFFF);

  Color get fontWhColor4 => colorMap['fontWhColor4'] ?? const Color(0x38FFFFFF);

  /// 中性面板色组----------------------------------------------------

  ///#FFFFFF
  Color get whiteColor1 => colorMap['whiteColor1'] ?? const Color(0xFFFFFFFF);

  ///#F3F3F3
  Color get grayColor1 => colorMap['grayColor1'] ?? const Color(0xFFF3F3F3);

  ///#EEEEEE
  Color get grayColor2 => colorMap['grayColor2'] ?? const Color(0xFFEEEEEE);

  ///#E7E7E7
  Color get grayColor3 => colorMap['grayColor3'] ?? const Color(0xFFE7E7E7);

  ///#DCDCDC
  Color get grayColor4 => colorMap['grayColor4'] ?? const Color(0xFFDCDCDC);

  ///#C5C5C5
  Color get grayColor5 => colorMap['grayColor5'] ?? const Color(0xFFC5C5C5);

  ///#A6A6A6
  Color get grayColor6 => colorMap['grayColor6'] ?? const Color(0xFFA6A6A6);

  ///#8B8B8B
  Color get grayColor7 => colorMap['grayColor7'] ?? const Color(0xFF8B8B8B);

  ///#777777
  Color get grayColor8 => colorMap['grayColor8'] ?? const Color(0xFF777777);

  ///#5E5E5E
  Color get grayColor9 => colorMap['grayColor9'] ?? const Color(0xFF5E5E5E);

  ///#4B4B4B
  Color get grayColor10 => colorMap['grayColor10'] ?? const Color(0xFF4B4B4B);

  ///#383838
  Color get grayColor11 => colorMap['grayColor11'] ?? const Color(0xFF383838);

  ///#2C2C2C
  Color get grayColor12 => colorMap['grayColor12'] ?? const Color(0xFF2C2C2C);

  ///#242424
  Color get grayColor13 => colorMap['grayColor13'] ?? const Color(0xFF242424);

  ///#181818
  Color get grayColor14 => colorMap['grayColor14'] ?? const Color(0xFF181818);
}
