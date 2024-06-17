import '../index.dart';

class XNavbarAllTest extends StatelessWidget {
  const XNavbarAllTest({super.key});

  @override
  Widget build(BuildContext context) {
    return DemoTemplate(
      title: "背景与底部文字",
      child: Column(
        children: [
          XNavBar(
            title: "X Flutter",
            backgroundColor: XTheme.of(context).successNormalColor,
            belowTitleWidget: Text(
              "底部文字底部文字底部文字底部文字底部文字底部文字",
              style: TextStyle(color: XTheme.of(context).grayColor6),
            ),
          )
        ],
      ),
    );
  }
}
