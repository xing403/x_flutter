import '../index.dart';

class XButtonLoadingOrDisable extends StatelessWidget {
  const XButtonLoadingOrDisable({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoTemplate(
      title: "加载或禁止",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          XButton(
            text: "loading",
            loading: true,
          ),
          XButton(
            text: "disable",
            disabled: true,
          ),
          XButton(
            text: "disable",
            disabled: true,
            plain: true,
          ),
        ],
      ),
    );
  }
}
