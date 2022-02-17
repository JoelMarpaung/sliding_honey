import 'package:flutter/material.dart';
import '../../components/components.dart';

class MediumLevelScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(child: MediumLevelScreen());
  }

  const MediumLevelScreen({Key? key}) : super(key: key);

  @override
  State<MediumLevelScreen> createState() => _MediumLevelScreenState();
}

class _MediumLevelScreenState extends State<MediumLevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medium'),
      ),
      drawer: drawer(context),
      body: Container(),
    );
  }
}
