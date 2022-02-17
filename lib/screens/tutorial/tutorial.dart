import 'package:flutter/material.dart';
import '../../components/components.dart';

class TutorialScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(child: TutorialScreen());
  }

  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      drawer: drawer(context),
      body: Container(),
    );
  }
}
