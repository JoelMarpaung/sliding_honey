import 'dart:async';

import 'package:flutter/material.dart';
import '../layout/layout.dart';
import '../typography/typography.dart';
import '../colors/colors.dart';
import '../globals.dart';

class TotalMove extends StatefulWidget {
  final Stream<int> tileMove;
  final Stream<int> beeMove;

  const TotalMove({Key? key, required this.tileMove, required this.beeMove})
      : super(key: key);

  @override
  _TotalMoveState createState() => _TotalMoveState();
}

class _TotalMoveState extends State<TotalMove> {
  int tileMoveToDisplay = 0;
  int beeMoveToDisplay = 0;
  late StreamSubscription<int> streamSubscriptionTile;
  late StreamSubscription<int> streamSubscriptionBee;

  void _updateTileMoves(int newMoves) {
    setState(() {
      tileMoveToDisplay = newMoves;
    });
  }

  void _updateBeeMoves(int newMoves) {
    setState(() {
      beeMoveToDisplay = newMoves;
    });
  }

  @override
  void initState() {
    super.initState();
    if (!puzzleInitiated) {
      streamSubscriptionTile = widget.tileMove.listen((moves) {
        _updateTileMoves(moves);
      });
      streamSubscriptionBee = widget.beeMove.listen((moves) {
        _updateBeeMoves(moves);
      });
    }
  }

  @override
  void dispose() {
    streamSubscriptionTile.cancel();
    streamSubscriptionBee.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     Text(
    //       tileMoveToDisplay.toString(),
    //       textScaleFactor: 5.0,
    //       style: TextStyle(color: Colors.white),
    //     ),
    //     SizedBox(),
    //     Text(
    //       beeMoveToDisplay.toString(),
    //       textScaleFactor: 5.0,
    //       style: TextStyle(color: Colors.yellow),
    //     ),
    //   ],
    // );
    return ResponsiveLayoutBuilder(
      small: (context, child) => Center(child: child),
      medium: (context, child) => Center(child: child),
      large: (context, child) => child!,
      child: (currentSize) {
        final mainAxisAlignment = currentSize == ResponsiveLayoutSize.large
            ? MainAxisAlignment.start
            : MainAxisAlignment.center;

        final bodyTextStyle = currentSize == ResponsiveLayoutSize.small
            ? PuzzleTextStyle.bodySmall
            : PuzzleTextStyle.body;

        return Row(
          key: const Key('number_of_moves_and_tiles_left'),
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            AnimatedDefaultTextStyle(
              key: const Key('number_of_moves_and_tiles_left_moves'),
              style: PuzzleTextStyle.headline4.copyWith(
                color: PuzzleColors.white,
              ),
              duration: const Duration(milliseconds: 530),
              child: Text(tileMoveToDisplay.toString()),
            ),
            AnimatedDefaultTextStyle(
              style: bodyTextStyle.copyWith(
                color: PuzzleColors.white,
              ),
              duration: const Duration(milliseconds: 530),
              child: const Text(" tile's moves | "),
            ),
            AnimatedDefaultTextStyle(
              key: const Key('number_of_moves_and_tiles_left_tiles_left'),
              style: PuzzleTextStyle.headline4.copyWith(
                color: PuzzleColors.white,
              ),
              duration: const Duration(milliseconds: 530),
              child: Text(beeMoveToDisplay.toString()),
            ),
            AnimatedDefaultTextStyle(
              style: bodyTextStyle.copyWith(
                color: PuzzleColors.white,
              ),
              duration: const Duration(milliseconds: 530),
              child: const Text(" bee's moves"),
            ),
          ],
        );
      },
    );
  }
}
