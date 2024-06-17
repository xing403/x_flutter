import '../index.dart';

class XButtonTypes extends StatelessWidget {
  const XButtonTypes({super.key});

  List<Widget> _getButtons() {
    var types = [
      XButtonType.primary,
      XButtonType.danger,
      XButtonType.success,
      XButtonType.warning,
      XButtonType.info
    ];
    List<Widget> children = [];

    for (var plain in [false, true]) {
      for (var type in types) {
        children.add(XButton(
          type: type,
          text: type.name,
          fill: true,
          plain: plain,
        ));
        children.add(const SizedBox(height: 4));
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return DemoTemplate(
      title: "按钮类型",
      child: Column(
        children: _getButtons(),
      ),
    );
  }
}
