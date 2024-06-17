import 'package:flutter/material.dart';
import 'package:x_flutter/x_flutter.dart';
import 'demo_page_template.dart';
import '../router/index.dart';
import '../router/routes.dart';

/// 示例首页
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ExampleRoute.init();
  }

  @override
  Widget build(BuildContext context) {
    return DemoPageTemplate(
      title: widget.title,
      children: _buildChildren(context),
    );
  }

  List<Widget> _buildChildren(BuildContext context) {
    var children = <Widget>[];

    routes.forEach((key, value) {
      children.add(Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
        padding: const EdgeInsets.only(top: 3, bottom: 3),
        decoration: BoxDecoration(
            color: XTheme.of(context).brandClickColor,
            borderRadius: BorderRadius.all(
                Radius.circular(XTheme.of(context).radiusRound))),
        child: Text(
          key,
          style: TextStyle(color: XTheme.of(context).baseWhiteColor),
        ),
      ));

      for (var model in value) {
        children.add(XButton(
          text: model.name,
          fill: true,
          onTap: () {
            Navigator.pushNamed(context, model.path);
          },
        ));
        children.insert(
          children.length - 1,
          const SizedBox(height: 4),
        );
      }
    });
    return children;
  }
}
