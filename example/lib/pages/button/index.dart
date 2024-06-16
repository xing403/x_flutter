// import 'package:x_flutter/x_flutter.dart';

import '../../demo/index.dart';

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
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const [
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
