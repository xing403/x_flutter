import '../index.dart';

class XIconBox extends StatelessWidget {
  const XIconBox({
    super.key,
    required this.name,
  });

  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 90,
      child: Column(
        children: [
          Icon(
            XIcon.all[name],
            size: 50,
            color: XTheme.of(context).brandNormalColor,
          ),
          Expanded(
            child: Text(
              name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines:2,
              // style: _textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
