import 'package:flutter/material.dart';
import 'button/button_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('X Flutter'),
        ),
        body: const ButtonPage(),
      ),
    );
  }
}
