import '../components/index.dart';
import '../pages/index.dart';
import 'router_model.dart';

class PageInheritedTheme extends InheritedWidget {
  const PageInheritedTheme({
    super.key,
    required this.model,
    required super.child,
  });

  final RouteModel model;

  @override
  bool updateShouldNotify(covariant PageInheritedTheme oldWidget) {
    return model != oldWidget.model;
  }
}

PageBuilder _wrapInheritedTheme(WidgetBuilder builder) {
  return (context, model) =>
      PageInheritedTheme(model: model, child: builder(context));
}

Map<String, List<RouteModel>> routes = {
  "基础": [
    RouteModel(
      name: 'Button 按钮',
      path: 'button',
      builder: _wrapInheritedTheme(
        (context) => const ButtonPage(),
      ),
    ),
    RouteModel(
      name: 'Icon 图标',
      path: 'icon',
      builder: _wrapInheritedTheme(
        (context) => const IconsPage(),
      ),
    ),
  ],
  "导航": [
    RouteModel(
      name: 'Navbar 导航',
      path: 'navbar',
      builder: _wrapInheritedTheme(
        (context) => const NavBarPage(),
      ),
    ),
  ]
};
