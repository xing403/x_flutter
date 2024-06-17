// import 'package:x_flutter/x_flutter.dart';

import '../../components/index.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key, this.url = ''});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("url:$url is not found"),
    );
  }
}
