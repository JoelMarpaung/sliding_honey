import 'package:flutter/material.dart';
import '../layout/layout.dart';
import '../typography/typography.dart';
import '../colors/colors.dart';

class PuzzleName extends StatelessWidget {
  const PuzzleName({
    Key? key,
    this.color,
  }) : super(key: key);

  /// The color of this name, defaults to [PuzzleTheme.nameColor].
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (context, child) => const SizedBox(),
      medium: (context, child) => const SizedBox(),
      large: (context, child) => AnimatedDefaultTextStyle(
        style: PuzzleTextStyle.headline5.copyWith(
          color: PuzzleColors.white,
        ),
        duration: const Duration(milliseconds: 350),
        child: const Text(
          'Sliding Honey Puzzle',
        ),
      ),
    );
  }
}
