import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../../components/components.dart';
import '../../layout/layout.dart';
import '../../globals.dart';

class MediumLevelScreen extends StatelessWidget {
  const MediumLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medium'),
        backgroundColor: const Color(0xFF00504C),
      ),
      backgroundColor: const Color(0xFF00504C),
      drawer: const DrawerScreen(),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: const Padding(
              padding: EdgeInsets.all(70.0),
              child: PuzzleSectionsMedium(),
            ),
          ),
        );
      }),
    );
  }
}

class PuzzleSectionsMedium extends StatefulWidget {
  const PuzzleSectionsMedium({Key? key}) : super(key: key);

  @override
  State<PuzzleSectionsMedium> createState() => _PuzzleSectionsMediumState();
}

class _PuzzleSectionsMediumState extends State<PuzzleSectionsMedium> {
  // final StreamController<int> controllerTile = StreamController<int>();
  // final StreamController<int> controllerBee = StreamController<int>();
  @override
  void dispose() {
    puzzleInitiated = false;
    tileMove = 0;
    beeMove = 0;
    stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    gameStarted = false;
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
          PuzzleBoardHoneyMedium(
            size: 300,
            controllerTile: controllerTile,
            controllerBee: controllerBee,
          ),
          const ResponsiveGap(
            small: 8,
            medium: 18,
            large: 32,
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
          PuzzleBoardHoneyMedium(
            size: 400,
            controllerTile: controllerTile,
            controllerBee: controllerBee,
          ),
          const ResponsiveGap(
            small: 8,
            medium: 18,
            large: 32,
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
              PuzzleBoardHoneyMedium(
                size: 500,
                controllerTile: controllerTile,
                controllerBee: controllerBee,
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
