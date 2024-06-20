import 'package:x_flutter_demo/components/index.dart';

import '../demo_page_template.dart';

class SliderContainerPage extends StatelessWidget {
  const SliderContainerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const DemoPageTemplate(
      title: "X Flutter slider container",
      children: [
        XSliderContainer(
          leftChild: Row(
            children: [
              XButton(
                text: 'item1',
                shape: XButtonShape.square,
              ),
            ],
          ),
          child: XButton(
            text: 'body1',
            shape: XButtonShape.square,
          ),
        ),
        XSliderContainer(
          child: XButton(
            text: 'body2',
            shape: XButtonShape.square,
          ),
        ),
        XSliderContainer(
          child: XButton(
            text: 'body3',
            shape: XButtonShape.square,
          ),
        )
      ],
    );
  }
}
