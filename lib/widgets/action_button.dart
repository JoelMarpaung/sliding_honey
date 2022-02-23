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
    // final text = gameStarted ? 'Re-play' : 'Start Game';
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.pressed)
              ? Colors.white
              : Colors.orangeAccent;
          return BorderSide(color: color, width: 2);
        }),
      ),
      onPressed: () async {
        setState(() {
          gameStarted = true;
          stopWatchTimer.onExecute.add(StopWatchExecute.reset);
          stopWatchTimer.onExecute.add(StopWatchExecute.start);
          beeMove = 0;
          tileMove = 0;
          controllerTile.add(tileMove);
          controllerBee.add(beeMove);
          gamePlay.add(gameStarted);
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(child: child, scale: animation);
        },
        child: gameStarted
            ? const Text(
                'Re-start',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )
            : const Text(
                'Start Game',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
      ),
    );
  }
}
