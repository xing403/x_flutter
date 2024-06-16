import '../index.dart';

class XButtonShapes extends StatelessWidget {
  const XButtonShapes({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoTemplate(
      title: "按钮形状",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          XButton(
            text: "radius",
            shape: XButtonShape.radius,
          ),
          XButton(
            text: "round",
            shape: XButtonShape.round,
          ),
          XButton(
            text: "square",
            shape: XButtonShape.square,
          ),
        ],
      ),
    );
  }
}
