import 'package:flutter/material.dart';
import 'package:x_flutter/x_flutter.dart';
import 'router/routes.dart';
import 'router/index.dart';
import 'pages/home.dart';

void main() {
  runApp(const MainApp());

  routes.forEach((key, value) {
    for (var model in value) {
      pages.add(model);
    }
  });
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late XThemeData _themeData;

  @override
  void initState() {
    super.initState();
    _themeData = XThemeData.defaultData();
  }

  @override
  Widget build(BuildContext context) {
    XTheme.needMultiTheme();
    return MaterialApp(
      title: 'X Flutter',
      theme: ThemeData(
        extensions: [_themeData],
        colorScheme: ColorScheme.light(primary: _themeData.brandNormalColor),
      ),
      home: const HomePage(title: 'X Flutter'),
      onGenerateRoute: ExampleRoute.onGenerateRoute,
      routes: _getRoutes(),
    );
  }

  Map<String, WidgetBuilder> _getRoutes() {
   return const {};
  }
}
