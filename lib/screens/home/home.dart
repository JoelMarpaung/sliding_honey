import 'package:flutter/material.dart';
import '../../components/components.dart';

class HomeScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(child: HomeScreen());
  }

  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: drawer(context),
      body: Container(),
    );
  }
}
