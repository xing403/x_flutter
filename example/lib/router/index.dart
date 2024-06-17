import 'routes.dart';
import 'router_model.dart';

import '../components/index.dart';
import '../pages/error/not_found.dart';

List<RouteModel> pages = [];

class ExampleRoute {
  static final Map<String, RouteModel> modelList = {};

  static void init() {
    routes.forEach((key, value) {
      for (var model in value) {
        modelList[model.path] = model;
      }
    });
  }

  static void add(RouteModel model) {
    modelList[model.name] = model;
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final url = settings.name ?? 'unknown';
    var strings = url.split('?');
    var name = strings[0];
    var model = modelList[name];
    var paramsMap = <String, String>{};
    if (strings.length > 1) {
      var params = strings[1].split('&');
      for (var element in params) {
        var kv = element.split('=');
        var key = kv[0];
        var value = '';
        if (kv.length > 1) {
          value = kv[1];
        }
        paramsMap[key] = value;
      }
    }
    if (model != null) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => model.builder(context, model),
      );
    } else {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => NotFoundPage(url: url),
      );
    }
  }
}
