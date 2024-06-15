import 'package:flutter_test/flutter_test.dart';
import 'package:x_flutter/x_flutter.dart';

void main() {
  test('xButton', () {
    String text = "XButton";
    int num = 0;
    onTap() {
      num += 1;
    }

    onLongPress() {
      num += 2;
    }

    final button = XButton(
      text: text,
      onTap: onTap,
      onLongPress: onLongPress,
    );
    button.onTap!();
    expect(num, 1);
    button.onLongPress!();
    expect(num, 3);
  });
}
