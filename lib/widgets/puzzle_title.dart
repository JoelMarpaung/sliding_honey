import 'package:flutter/material.dart';
import '../layout/layout.dart';
import '../typography/typography.dart';
import '../colors/colors.dart';

class PuzzleTitle extends StatelessWidget {
  const PuzzleTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      small: (context, child) => Center(
        child: SizedBox(
          width: 300,
          child: Center(
            child: child,
          ),
        ),
      ),
      medium: (context, child) => Center(
        child: child,
      ),
      large: (context, child) => SizedBox(
        width: 300,
        child: child,
      ),
      child: (currentSize) {
        final textStyle = (currentSize == ResponsiveLayoutSize.large
                ? PuzzleTextStyle.headline2
                : PuzzleTextStyle.headline3)
            .copyWith(
          color: PuzzleColors.white,
        );

        final textAlign = currentSize == ResponsiveLayoutSize.small
            ? TextAlign.center
            : TextAlign.left;

        return AnimatedDefaultTextStyle(
          style: textStyle,
          duration: const Duration(microseconds: 530),
          child: Text(
            title,
            textAlign: textAlign,
          ),
        );
      },
    );
  }
}
