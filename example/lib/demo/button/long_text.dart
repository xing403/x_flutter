import '../index.dart';

class XButtonLongText extends StatelessWidget {
  const XButtonLongText({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoTemplate(
      title: "长文本省略",
      child: Column(
        children: [
          XButton(
            text: "这是一个很长的文本。这是一个很长的文本。这是一个很长的文本。这是一个很长的文本。",
            fill: true,
          ),
        ],
      ),
    );
  }
}
