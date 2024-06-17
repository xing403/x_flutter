import '../index.dart';
import '../../components/index.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const DemoPageTemplate(
      title: "X Flutter Navbar",
      children: [
        XNavbarDefaultTest(),
        XNavbarAllTest(),
      ],
    );
  }
}
