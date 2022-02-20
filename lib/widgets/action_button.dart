import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../globals.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
          final Color color =
              states.contains(MaterialState.pressed) ? Colors.blue : Colors.red;
          return BorderSide(color: color, width: 2);
        }),
      ),
      onPressed: () async {
        stopWatchTimer.onExecute.add(StopWatchExecute.start);
      },
      child: const Text('Start Game'),
    );
  }
}
