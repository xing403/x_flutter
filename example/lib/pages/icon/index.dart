import '../index.dart';
import '../../components/index.dart';

class IconsPage extends StatefulWidget {
  const IconsPage({super.key});

  @override
  createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  List<Row> _getAllIcons() {
    int index = 0;
    List<Row> children = [];
    List<Widget> rowChildren = [];

    XIcon.all.forEach((key, value) {
      rowChildren.add(
        XIconBox(name: key),
      );
      if ((index + 1) % 4 == 0) {
        children.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowChildren,
        ));
        rowChildren = [];
      }
      index += 1;
    });

    return children;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DemoPageTemplate(
      title: "X Flutter Icons",
      children: _getAllIcons(),
    );
  }
}
