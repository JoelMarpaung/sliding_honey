import 'package:flutter/material.dart';
import '../../components/components.dart';

class HardLevelScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(child: HardLevelScreen());
  }

  const HardLevelScreen({Key? key}) : super(key: key);

  @override
  State<HardLevelScreen> createState() => _HardLevelScreenState();
}

class _HardLevelScreenState extends State<HardLevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hard'),
      ),
      drawer: drawer(context),
      body: Container(),
    );
  }
}
