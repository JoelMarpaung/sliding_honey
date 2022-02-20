import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../../components/components.dart';
import '../../layout/layout.dart';
import '../../globals.dart';

class EasyLevelScreen extends StatelessWidget {
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
              padding: EdgeInsets.all(70.0),
              child: PuzzleSections(),
            ),
          ),
        );
      }),
    );
  }
}

class PuzzleSections extends StatefulWidget {
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
    tileMove = 0;
    beeMove = 0;
    stopWatchTimer.onExecute.add(StopWatchExecute.reset);
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
            size: 300,
            controllerTile1: controllerTile,
            controllerBee2: controllerBee,
          ),
          const EndSection(),
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
            size: 400,
            controllerTile1: controllerTile,
            controllerBee2: controllerBee,
          ),
          const EndSection(),
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
                size: 500,
                controllerTile1: controllerTile,
                controllerBee2: controllerBee,
              ),
              const Expanded(
                child: EndSection(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
