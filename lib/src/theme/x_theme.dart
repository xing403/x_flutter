import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../../x_flutter.dart';
import '../utils/colors.dart';

/// 主题控件
class XTheme extends StatelessWidget {
  const XTheme({required this.data, required this.child, this.systemData, super.key});

  /// 仅使用Default主题，不需要切换主题功能
  static bool _needMultiTheme = true;

  /// 主题数据
  static XThemeData? _singleData;

  /// 子控件
  final Widget child;

  /// 主题数据
  final XThemeData data;

  /// Flutter系统主题数据
  final ThemeData? systemData;

  @override
  Widget build(BuildContext context) {
    if (!_needMultiTheme) {
      _singleData = data;
    }
    var extensions = [data];
    return Theme(data: systemData?.copyWith(extensions: extensions) ?? ThemeData(extensions: extensions), child: child);
  }

  static void needMultiTheme([bool value = true]) {
    _needMultiTheme = value;
  }

  static XThemeData defaultData() {
    return XThemeData.defaultData();
  }

  static XThemeData of([BuildContext? context]) {
    if (!_needMultiTheme || context == null) {
      return _singleData ?? XThemeData.defaultData();
    }
    try {
      var data = Theme.of(context).extensions[XThemeData] as XThemeData?;
      return data ?? XThemeData.defaultData();
    } catch (e) {
      return XThemeData.defaultData();
    }
  }

  static XThemeData? ofNullable([BuildContext? context]) {
    if (context != null) {
      return Theme.of(context).extensions[XThemeData] as XThemeData?;
    } else {
      return null;
    }
  }
}

/// 主题数据
class XThemeData extends ThemeExtension<XThemeData> {
  static const String _defaultThemeName = 'light';
  static XThemeData? _defaultThemeData;

  /// 名称
  late String name;

  /// 颜色
  late SplayTreeMap<String, Color> colorMap;

  /// 字体尺寸
  late SplayTreeMap<String, Font> fontMap;

  /// 圆角
  late SplayTreeMap<String, double> radiusMap;

  /// 阴影
  late SplayTreeMap<String, List<BoxShadow>> shadowMap;

  /// 间隔
  late SplayTreeMap<String, double> spacerMap;

  /// 映射关系
  late SplayTreeMap<String, String> refMap;

  /// 额外定义的结构
  late XExtraThemeData? extraThemeData;

  @override
  ThemeExtension<XThemeData> copyWith({
    String? name,
    Map<String, Color>? colorMap,
    Map<String, double>? radiusMap,
    Map<String, List<BoxShadow>>? shadowMap,
    Map<String, double>? marginMap,
  }) {
    var result = XThemeData(
        name: name ?? 'default',
        colorMap: _copyMap<Color>(this.colorMap, colorMap),
        fontMap: _copyMap<Font>(this.fontMap, fontMap),
        radiusMap: _copyMap<double>(this.radiusMap, radiusMap),
        shadowMap: _copyMap<List<BoxShadow>>(this.shadowMap, shadowMap),
        spacerMap: _copyMap<double>(spacerMap, marginMap),
        refMap: _copyMap<String>(refMap, refMap));
    return result;
  }

  XThemeData({
    required this.name,
    required this.colorMap,
    required this.fontMap,
    required this.radiusMap,
    required this.shadowMap,
    required this.spacerMap,
    required this.refMap,
  });

  static XThemeData defaultData({XExtraThemeData? extraThemeData}) {
    _defaultThemeData ??= fromJson(_defaultThemeName, XDefaultTheme.defaultThemeConfig, extraThemeData: extraThemeData) ??
        _emptyData(_defaultThemeName, extraThemeData: extraThemeData);
    return _defaultThemeData!;
  }

  /// 拷贝Map,防止内层
  SplayTreeMap<String, T> _copyMap<T>(SplayTreeMap<String, T> src, Map<String, T>? add) {
    var map = SplayTreeMap<String, T>();

    src.forEach((key, value) {
      map[key] = value;
    });
    if (add != null) {
      map.addAll(add);
    }
    return map;
  }

  @override
  ThemeExtension<XThemeData> lerp(covariant ThemeExtension<XThemeData>? other, double t) {
    if (other is! XThemeData) {
      return this;
    }
    return XThemeData(
        name: other.name,
        colorMap: other.colorMap,
        fontMap: other.fontMap,
        radiusMap: other.radiusMap,
        shadowMap: other.shadowMap,
        spacerMap: other.spacerMap,
        refMap: other.refMap);
  }

  static XThemeData? fromJson(String name, String themeJson, {var recoverDefault = false, XExtraThemeData? extraThemeData}) {
    if (themeJson.isEmpty) {
      return null;
    }
    try {
      /// 要求json配置必须正确
      final themeConfig = json.decode(themeJson);
      if (themeConfig.containsKey(name)) {
        var theme = _emptyData(name);

        Map<String, dynamic> curThemeMap = themeConfig['$name'];

        /// 设置颜色
        Map<String, dynamic>? colorsMap = curThemeMap['color'];
        colorsMap?.forEach((key, value) {
          var color = toColor(value);
          if (color != null) {
            theme.colorMap[key] = color;
          }
        });

        /// 设置颜色
        Map<String, dynamic>? refMap = curThemeMap['ref'];
        refMap?.forEach((key, value) {
          theme.refMap[key] = value;
        });

        /// 设置字体尺寸
        // Map<String, dynamic>? fontsMap = curThemeMap['font'];
        // fontsMap?.forEach((key, value) {
        //   theme.fontMap[key] = Font.fromJson(value);
        // });

        /// 设置圆角
        Map<String, dynamic>? cornersMap = curThemeMap['radius'];
        cornersMap?.forEach((key, value) {
          theme.radiusMap[key] = value.toDouble();
        });

        /// 设置字体
        // Map<String, dynamic>? fontFamilyMap = curThemeMap['fontFamily'];
        // fontFamilyMap?.forEach((key, value) {
        //   theme.fontFamilyMap[key] = FontFamily.fromJson(value);
        // });

        /// 设置阴影
        Map<String, dynamic>? shadowMap = curThemeMap['shadow'];
        shadowMap?.forEach((key, value) {
          var list = <BoxShadow>[];
          for (var element in (value as List)) {
            list.add(BoxShadow(
              color: toColor(element['color']) ?? Colors.black,
              blurRadius: element['blurRadius'].toDouble(),
              spreadRadius: element['spreadRadius'].toDouble(),
              offset: Offset(element['offset']?['x'].toDouble() ?? 0, element['offset']?['y'].toDouble() ?? 0),
            ));
          }

          theme.shadowMap[key] = list;
        });

        /// 设置Margin
        Map<String, dynamic>? marginsMap = curThemeMap['margin'];
        marginsMap?.forEach((key, value) {
          theme.spacerMap[key] = value.toDouble();
        });

        if (extraThemeData != null) {
          extraThemeData.parse(name, curThemeMap);
          theme.extraThemeData = extraThemeData;
        }
        if (recoverDefault) {
          _defaultThemeData = theme;
        }
        return theme;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  /// 创建空对象
  static XThemeData _emptyData(String name, {XExtraThemeData? extraThemeData}) {
    var refMap = SplayTreeMap<String, String>();
    return XThemeData(
      name: name,
      colorMap: SplayTreeMap(),
      fontMap: SplayTreeMap(),
      radiusMap: SplayTreeMap(),
      shadowMap: SplayTreeMap(),
      spacerMap: SplayTreeMap(),
      refMap: refMap,
    );
  }
}

/// 扩展主题数据
abstract class XExtraThemeData {
  /// 解析json
  void parse(String name, Map<String, dynamic> curThemeMap);
}
