import '../index.dart';

class XButtonTypes extends StatelessWidget {
  const XButtonTypes({super.key});

  List<XButton> _getButtons() {
    var types = [XButtonType.primary, XButtonType.danger, XButtonType.success, XButtonType.warning, XButtonType.info];
    List<XButton> buttons = [];
    for (var type in types) {
      buttons.add(XButton(
        type: type,
        text: type.name,
        fill: true,
      ));
    }
    for (var type in types) {
      buttons.add(XButton(
        type: type,
        text: type.name,
        fill: true,
        plain: true,
      ));
    }
    return buttons;
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
