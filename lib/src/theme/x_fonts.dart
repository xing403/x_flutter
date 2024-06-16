import 'package:flutter/cupertino.dart';
import 'x_theme.dart';

/// 字体宽高数据
class Font {
  late double size;
  late double height;
  late FontWeight fontWeight;

  Font({required int size, required int lineHeight, this.fontWeight = FontWeight.w400}) {
    this.size = size.toDouble();
    height = lineHeight.toDouble() / size;
  }

  factory Font.fromJson(Map<String, dynamic> map) => Font(size: map['size'], lineHeight: map['lineHeight'], fontWeight: _getFontWeight(map));

  static FontWeight _getFontWeight(Map<String, dynamic> map) {
    int weight = map['fontWeight'] ?? 4;
    return FontWeight.values[weight - 1];
  }
}

/// 内置字体数据
extension XFonts on XThemeData {
  /// 字体大小/行高
  /// 64/72
  Font? get fontDisplayLarge => fontMap['fontDisplayLarge'];

  /// 48/56
  Font? get fontDisplayMedium => fontMap['fontDisplayMedium'];

  /// 36/44
  Font? get fontHeadlineLarge => fontMap['fontHeadlineLarge'];

  /// 28/36
  Font? get fontHeadlineMedium => fontMap['fontHeadlineMedium'];

  /// 24/32
  Font? get fontHeadlineSmall => fontMap['fontHeadlineSmall'];

  /// 20/28
  Font? get fontTitleExtraLarge => fontMap['fontTitleExtraLarge'];

  /// 18/26
  Font? get fontTitleLarge => fontMap['fontTitleLarge'];

  /// 16/24
  Font? get fontTitleMedium => fontMap['fontTitleMedium'];

  /// 14/22
  Font? get fontTitleSmall => fontMap['fontTitleSmall'];

  /// 18/26
  Font? get fontBodyExtraLarge => fontMap['fontBodyExtraLarge'];

  /// 16/24
  Font? get fontBodyLarge => fontMap['fontBodyLarge'];

  /// 14/22
  Font? get fontBodyMedium => fontMap['fontBodyMedium'];

  /// 12/20
  Font? get fontBodySmall => fontMap['fontBodySmall'];

  /// 10/16
  Font? get fontBodyExtraSmall => fontMap['fontBodyExtraSmall'];

  /// 16/24
  Font? get fontMarkLarge => fontMap['fontMarkLarge'];

  /// 14/22
  Font? get fontMarkMedium => fontMap['fontMarkMedium'];

  /// 12/20
  Font? get fontMarkSmall => fontMap['fontMarkSmall'];

  /// 10/16
  Font? get fontMarkExtraSmall => fontMap['fontMarkExtraSmall'];

  /// 16/24
  Font? get fontLinkLarge => fontMap['fontLinkLarge'];

  /// 14/22
  Font? get fontLinkMedium => fontMap['fontLinkMedium'];

  /// 12/20
  Font? get fontLinkSmall => fontMap['fontLinkSmall'];
}
