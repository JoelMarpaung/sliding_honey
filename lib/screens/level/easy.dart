import 'package:flutter/material.dart';
import '../../components/components.dart';

class EasyLevelScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(child: EasyLevelScreen());
  }

  const EasyLevelScreen({Key? key}) : super(key: key);

  @override
  State<EasyLevelScreen> createState() => _EasyLevelScreenState();
}

class _EasyLevelScreenState extends State<EasyLevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy'),
      ),
      drawer: drawer(context),
      body: Container(),
    );
  }
}
