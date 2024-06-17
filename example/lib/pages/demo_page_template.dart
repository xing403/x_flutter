import 'package:flutter/material.dart';
import 'package:x_flutter/x_flutter.dart';

class DemoPageTemplate extends StatefulWidget {
  const DemoPageTemplate({
    super.key,
    required this.title,
    this.desc = '',
    this.children = const [],
    this.child,
  });

  final String title;
  final String desc;
  final List<Widget> children;
  final Widget? child;
  @override
  _DemoPageTemplateState createState() => _DemoPageTemplateState();
}

class _DemoPageTemplateState extends State<DemoPageTemplate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XNavBar(
        title: widget.title,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              widget.child != null ? <Widget>[widget.child!] : widget.children,
        ),
      ),
    );
  }
}
