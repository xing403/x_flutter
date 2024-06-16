import 'dart:ui';

import 'package:flutter/material.dart';
import 'x_theme.dart';

extension XColors on XThemeData {
  Color get brandColor1 => colorMap['brandColor1'] ?? const Color(0xFFecf5ff);
  Color get brandColor2 => colorMap['brandColor2'] ?? const Color(0xFFd9ecff);
  Color get brandColor3 => colorMap['brandColor3'] ?? const Color(0xFFc6e2ff);
  Color get brandColor4 => colorMap['brandColor4'] ?? const Color(0xFFa0cfff);
  Color get brandColor5 => colorMap['brandColor5'] ?? const Color(0xFF79bbff);
  Color get brandColor6 => colorMap['brandColor6'] ?? const Color(0xFF409eff);
  Color get brandColor7 => colorMap['brandColor7'] ?? const Color(0xFF337ecc);
  Color get brandFocusColor => colorMap['brandFocusColor'] ?? brandColor7;
  Color get brandDisabledColor => colorMap['brandDisabledColor'] ?? brandColor4;
  Color get brandHoverColor => colorMap['brandHoverColor'] ?? brandColor5;
  Color get brandNormalColor => colorMap['brandNormalColor'] ?? brandColor6;
  Color get brandClickColor => colorMap['brandClickColor'] ?? brandColor7;

  /// 错误色组----------------------------------------------------

  ///#FFF0ED
  Color get errorColor1 => colorMap['errorColor1'] ?? const Color(0xFFfef0f0);

  ///#FFD8D2
  Color get errorColor2 => colorMap['errorColor2'] ?? const Color(0xFFfde2e2);

  ///#FFB9B0
  Color get errorColor3 => colorMap['errorColor3'] ?? const Color(0xFFfcd3d3);

  ///#FF9285
  Color get errorColor4 => colorMap['errorColor4'] ?? const Color(0xFFfab6b6);

  ///#F6685D
  Color get errorColor5 => colorMap['errorColor5'] ?? const Color(0xFFf89898);

  ///#D54941
  Color get errorColor6 => colorMap['errorColor6'] ?? const Color(0xFFF56C6C);

  ///#AD352F
  Color get errorColor7 => colorMap['errorColor7'] ?? const Color(0xFFc45656);

  ///#FFD8D2
  Color get errorFocusColor => colorMap['errorFocusColor'] ?? errorColor7;

  ///#FFB9B0
  Color get errorDisabledColor => colorMap['errorDisabledColor'] ?? errorColor4;

  ///#F6685D
  Color get errorHoverColor => colorMap['errorHoverColor'] ?? errorColor5;

  ///#D54941
  Color get errorNormalColor => colorMap['errorNormalColor'] ?? errorColor6;

  ///#AD352F
  Color get errorClickColor => colorMap['errorClickColor'] ?? errorColor7;

  /// 警告色组----------------------------------------------------

  ///#FFF1E9
  Color get warningColor1 => colorMap['warningColor1'] ?? const Color(0xFFfdf6ec);

  ///#faecd8
  Color get warningColor2 => colorMap['warningColor2'] ?? const Color(0xFFfaecd8);

  ///#FFB98C
  Color get warningColor3 => colorMap['warningColor3'] ?? const Color(0xFFf8e3c5);

  Color get warningColor4 => colorMap['warningColor4'] ?? const Color(0xFFf3d19e);

  Color get warningColor5 => colorMap['warningColor5'] ?? const Color(0xFFeebe77);

  Color get warningColor6 => colorMap['warningColor6'] ?? const Color(0xFFE6A23C);

  Color get warningColor7 => colorMap['warningColor7'] ?? const Color(0xFFb88230);

  Color get warningFocusColor => colorMap['warningFocusColor'] ?? warningColor7;

  Color get warningDisabledColor => colorMap['warningDisabledColor'] ?? warningColor4;

  Color get warningHoverColor => colorMap['warningHoverColor'] ?? warningColor5;

  Color get warningNormalColor => colorMap['warningNormalColor'] ?? warningColor6;

  Color get warningClickColor => colorMap['warningClickColor'] ?? warningColor7;

  /// 成功色组----------------------------------------------------

  Color get successColor1 => colorMap['successColor1'] ?? const Color(0xFFf0f9eb);

  Color get successColor2 => colorMap['successColor2'] ?? const Color(0xFFe1f3d8);

  Color get successColor3 => colorMap['successColor3'] ?? const Color(0xFFd1edc4);

  Color get successColor4 => colorMap['successColor4'] ?? const Color(0xFFb3e19d);

  Color get successColor5 => colorMap['successColor5'] ?? const Color(0xFF95d475);

  Color get successColor6 => colorMap['successColor6'] ?? const Color(0xFF67C23A);

  Color get successColor7 => colorMap['successColor7'] ?? const Color(0xFF529b2e);

  Color get successFocusColor => colorMap['successFocusColor'] ?? successColor7;

  Color get successDisabledColor => colorMap['successDisabledColor'] ?? successColor4;

  Color get successHoverColor => colorMap['successHoverColor'] ?? successColor5;

  Color get successNormalColor => colorMap['successNormalColor'] ?? successColor6;

  Color get successClickColor => colorMap['successClickColor'] ?? successColor7;

  /// 中性面板色组----------------------------------------------------
  ///#F3F3F3
  Color get grayColor1 => colorMap['grayColor1'] ?? const Color(0xFFf4f4f5);

  ///#EEEEEE
  Color get grayColor2 => colorMap['grayColor2'] ?? const Color(0xFFe9e9eb);

  ///#E7E7E7
  Color get grayColor3 => colorMap['grayColor3'] ?? const Color(0xFFdedfe0);

  ///#DCDCDC
  Color get grayColor4 => colorMap['grayColor4'] ?? const Color(0xFFc8c9cc);

  ///#C5C5C5
  Color get grayColor5 => colorMap['grayColor5'] ?? const Color(0xFFb1b3b8);

  ///#A6A6A6
  Color get grayColor6 => colorMap['grayColor6'] ?? const Color(0xFF909399);

  ///#8B8B8B
  Color get grayColor7 => colorMap['grayColor7'] ?? const Color(0xFF73767a);

  Color get brandTextColor => colorMap['brandTextColor'] ?? const Color(0xFF303133);
  Color get regularTextColor => colorMap['regularTextColor'] ?? const Color(0xFF606266);
  Color get secondaryTextColor => colorMap['secondaryTextColor'] ?? const Color(0xFF909399);
  Color get placeholderTextColor => colorMap['placeholderTextColor'] ?? const Color(0xFFA8ABB2);
  Color get disabledTextColor => colorMap['disabledTextColor'] ?? const Color(0xFFC0C4CC);
  Color get darkerBorderColor => colorMap['darkerBorderColor'] ?? const Color(0xFFCDD0D6);
  Color get darkBorderColor => colorMap['darkBorderColor'] ?? const Color(0xFF1F2D3D);
  Color get baseBorderColor => colorMap['baseBorderColor'] ?? const Color(0xFFDCDFE6);
  Color get lightBorderColor => colorMap['lightBorderColor'] ?? const Color(0xFFE4E7ED);
  Color get lighterBorderColor => colorMap['lighterBorderColor'] ?? const Color(0xFFEBEEF5);
  Color get darkerFillColor => colorMap['darkerFillColor'] ?? const Color(0xFFEBEDF0);
  Color get baseFillColor => colorMap['baseFillColor'] ?? const Color(0xFFF0F2F5);
  Color get lightFillColor => colorMap['lightFillColor'] ?? const Color(0xFFF5F7FA);
  Color get lighterFillColor => colorMap['lighterFillColor'] ?? const Color(0xFFFAFAFA);
  Color get blankFillColor => colorMap['blankFillColor'] ?? const Color(0xFFFFFFFF);
  Color get baseBlackColor => colorMap['baseBlackColor'] ?? const Color(0xFF000000);
  Color get baseWhiteColor => colorMap['baseWhiteColor'] ?? const Color(0xFFFFFFFF);
  Color get transparent => colorMap['transparent'] ?? const Color(0x00000000);
  Color get pageBackgroundColor => colorMap['pageBackgroundColor'] ?? const Color(0xFFF2F3F5);
  Color get baseBackgroundColor => colorMap['baseBackgroundColor'] ?? const Color(0xFFFFFFFF);
}
