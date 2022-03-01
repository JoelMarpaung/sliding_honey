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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        ResponsiveGap(
          small: 10,
          medium: 10,
          large: 50,
        ),
        ActionButton(),
        ResponsiveGap(
          small: 30,
          medium: 30,
          large: 30,
        ),
        Image(
          image: AssetImage('assets/images/bee.png'),
          width: 200,
        ),
      ],
    );
  }
}
