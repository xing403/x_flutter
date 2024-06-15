import 'package:flutter/material.dart';
import 'package:x_flutter/x_flutter.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  XButtonType _type = XButtonType.primary;
  @override
  void initState() {
    super.initState();
    _type = XButtonType.primary;
  }

  onTap() {
    setState(() {
      _type = _type == XButtonType.primary ? XButtonType.danger : XButtonType.primary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return XButton(
      text: "hello world",
      type: _type,
      size: XButtonSize.small,
      onTap: onTap,
    );
  }
}
