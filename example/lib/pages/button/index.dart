import '../index.dart';
import '../../components/index.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const DemoPageTemplate(
      title: "X Flutter button",
      children: [
        Center(
          child: XButtonTypes(),
        ),
        Center(
          child: XButtonSizes(),
        ),
        Center(
          child: XButtonShapes(),
        ),
        Center(
          child: XButtonLoadingOrDisable(),
        ),
        Center(
          child: XButtonLongText(),
        ),
      ],
    );
  }
}
