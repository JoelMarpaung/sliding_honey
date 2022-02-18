import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../layout/layout.dart';
import '../widgets/widgets.dart';

class StartSection extends StatefulWidget {
  /// {@macro puzzle_board}

  const StartSection(
      {Key? key, required this.controllerTile, required this.controllerBee})
      : super(key: key);
  final StreamController<int> controllerTile;
  final StreamController<int> controllerBee;
  @override
  State<StartSection> createState() => _StartSectionState();
}

class _StartSectionState extends State<StartSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ResponsiveGap(
          small: 20,
          medium: 83,
          large: 151,
        ),
        const PuzzleName(),
        const ResponsiveGap(large: 16),
        const PuzzleTitle(
          title: 'Sliding Honey',
        ),
        const ResponsiveGap(
          small: 12,
          medium: 16,
          large: 32,
        ),
        TotalMove(
            tileMove: widget.controllerTile.stream,
            beeMove: widget.controllerBee.stream),
        // NumberOfMovesAndTilesLeft(
        //   key: numberOfMovesAndTilesLeftKey,
        //   numberOfMoves: state.numberOfMoves,
        //   numberOfTilesLeft: status == DashatarPuzzleStatus.started
        //       ? state.numberOfTilesLeft
        //       : state.puzzle.tiles.length - 1,
        // ),
        const ResponsiveGap(
          small: 8,
          medium: 18,
          large: 32,
        ),
        ResponsiveLayoutBuilder(
            small: (_, __) => const SizedBox(),
            medium: (_, __) => const SizedBox(),
            large: (_, __) =>
                const SizedBox() //const DashatarPuzzleActionButton(),
            ),
        ResponsiveLayoutBuilder(
          small: (_, __) => const SizedBox(), //DashatarTimer(),
          medium: (_, __) => const SizedBox(), //const DashatarTimer(),
          large: (_, __) => const SizedBox(),
        ),
        const ResponsiveGap(small: 12),
      ],
    );
  }
}
