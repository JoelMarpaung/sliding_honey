import 'dart:async';

import 'package:flutter/material.dart';
import '../../components/components.dart';
import '../../layout/layout.dart';
import '../../globals.dart';

class EasyLevelScreen extends StatelessWidget {
  /// {@macro puzzle_view}
  const EasyLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy'),
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
              padding: EdgeInsets.all(50.0),
              child: PuzzleSections(),
            ),
          ),
        );
      }),
      //body: const PuzzleBoardHoney(),
    );
  }
}

class PuzzleSections extends StatefulWidget {
  /// {@macro puzzle_sections}
  const PuzzleSections({Key? key}) : super(key: key);

  @override
  State<PuzzleSections> createState() => _PuzzleSectionsState();
}

class _PuzzleSectionsState extends State<PuzzleSections> {
  // final StreamController<int> controllerTile = StreamController<int>();
  // final StreamController<int> controllerBee = StreamController<int>();
  @override
  void dispose() {
    puzzleInitiated = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (context, child) => Column(
        children: [
          StartSection(
            controllerTile: controllerTile,
            controllerBee: controllerBee,
          ),
          const ResponsiveGap(
            small: 8,
            medium: 18,
            large: 32,
          ),
          PuzzleBoardHoney(
            size: 350,
            controllerTile1: controllerTile,
            controllerBee2: controllerBee,
          ),
          Container(
            color: Colors.teal,
          ),
        ],
      ),
      medium: (context, child) => Column(
        children: [
          StartSection(
            controllerTile: controllerTile,
            controllerBee: controllerBee,
          ),
          const ResponsiveGap(
            small: 8,
            medium: 18,
            large: 32,
          ),
          PuzzleBoardHoney(
            size: 450,
            controllerTile1: controllerTile,
            controllerBee2: controllerBee,
          ),
          Container(
            color: Colors.teal,
          ),
        ],
      ),
      large: (context, child) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: StartSection(
                  controllerTile: controllerTile,
                  controllerBee: controllerBee,
                ),
              ),
              PuzzleBoardHoney(
                size: 550,
                controllerTile1: controllerTile,
                controllerBee2: controllerBee,
              ),
              Expanded(
                child: Container(
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
