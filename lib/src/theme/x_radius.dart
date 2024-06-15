import 'x_theme.dart';

/// 内置圆角数据
extension TDRadius on XThemeData {
  /// 圆角数据
  double get radiusSmall => radiusMap['radiusSmall'] ?? 3;
  double get radiusDefault => radiusMap['radiusDefault'] ?? 6;
  double get radiusLarge => radiusMap['radiusLarge'] ?? 9;

  /// 胶囊型，数值设置较大
  double get radiusRound => radiusMap['radiusRound'] ?? 9999;

  /// 圆形与胶囊型一致，如果长款一致即是圆形
  double get radiusCircle => radiusMap['radiusCircle'] ?? 9999;
}
