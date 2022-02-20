import 'dart:async';

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
          small: 0,
          medium: 0,
          large: 50,
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
        const ResponsiveGap(
          small: 8,
          medium: 18,
          large: 32,
        ),
        const Timer(),
      ],
    );
  }
}
