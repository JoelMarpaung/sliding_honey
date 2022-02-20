import 'package:flutter/material.dart';
import '../layout/layout.dart';
import '../widgets/widgets.dart';

class EndSection extends StatefulWidget {
  /// {@macro puzzle_board}

  const EndSection({Key? key}) : super(key: key);
  @override
  State<EndSection> createState() => _EndSectionState();
}

class _EndSectionState extends State<EndSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ResponsiveGap(
          small: 0,
          medium: 0,
          large: 50,
        ),
        ActionButton(),
      ],
    );
  }
}
