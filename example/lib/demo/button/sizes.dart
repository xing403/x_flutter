import '../index.dart';

class XButtonSizes extends StatelessWidget {
  const XButtonSizes({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoTemplate(
      title: "按钮大小",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          XButton(
            text: "small",
            type: XButtonType.primary,
            size: XButtonSize.small,
          ),
          XButton(
            text: "medium",
            type: XButtonType.primary,
            size: XButtonSize.medium,
          ),
          XButton(
            text: "large",
            type: XButtonType.primary,
            size: XButtonSize.large,
          ),
        ],
      ),
    );
  }
}
