import '../index.dart';

class XNavbarDefaultTest extends StatelessWidget {
  const XNavbarDefaultTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemoTemplate(
      title: "顶部导航 -- 默认",
      child: XNavBar(
        title: "X Flutter",
      ),
    );
  }
}
