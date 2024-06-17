import 'package:flutter/material.dart';

export 'package:flutter/material.dart';

class DemoTemplate extends StatelessWidget {
  const DemoTemplate({
    super.key,
    this.title,
    this.child,
    this.children,
  });
  final String? title;
  final Widget? child;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title ?? '',
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (children != null) ...children! else if (child != null) child!,
      ],
    );
  }
}
