import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../layout/layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF00504C),
      ),
      backgroundColor: const Color(0xFF00504C),
      drawer: drawer(context),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: const Padding(
              padding: EdgeInsets.all(70.0),
              child: HomeSections(),
            ),
          ),
        );
      }),
    );
  }
}

class HomeSections extends StatefulWidget {
  const HomeSections({Key? key}) : super(key: key);

  @override
  State<HomeSections> createState() => _HomeSectionsState();
}

class _HomeSectionsState extends State<HomeSections> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (context, child) => Column(
        children: const [
          TutorialSection(),
        ],
      ),
      medium: (context, child) => Column(
        children: const [
          TutorialSection(),
        ],
      ),
      large: (context, child) => Column(
        children: const [
          TutorialSection(),
        ],
      ),
    );
  }
}
