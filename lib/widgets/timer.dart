import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../layout/layout.dart';
import '../../globals.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final _isHours = true;

  @override
  void dispose() async {
    super.dispose();
    //await stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        small: (context, child) => Center(child: child),
        medium: (context, child) => Center(child: child),
        large: (context, child) => child!,
        child: (currentSize) {
          double textSize = currentSize == ResponsiveLayoutSize.small ? 25 : 30;
          final mainAxisAlignment = currentSize == ResponsiveLayoutSize.large
              ? MainAxisAlignment.start
              : MainAxisAlignment.center;
          return StreamBuilder<int>(
            stream: stopWatchTimer.rawTime,
            initialData: stopWatchTimer.rawTime.value,
            builder: (context, snap) {
              final value = snap.data!;
              final displayTime =
                  StopWatchTimer.getDisplayTime(value, hours: _isHours);
              return Row(
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  Text(
                    displayTime,
                    style: TextStyle(
                        fontSize: textSize,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Gap(8),
                  Icon(Icons.access_alarm, size: textSize, color: Colors.white),
                ],
              );
            },
          );
        });
  }
}
