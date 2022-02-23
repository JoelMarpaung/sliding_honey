import 'dart:async';
import 'package:stop_watch_timer/stop_watch_timer.dart';

bool puzzleInitiated = false;
bool gameStarted = false;
int q = 0, r = 0;
int qChar = 0, rChar = 0;
int qArr1 = 0, rArr1 = 0, qArr2 = 0, rArr2 = 0, qArr3 = 0, rArr3 = 0;
int arr1 = 0, arr2 = 0, arr3 = 0, arrow = 0;
int out1 = 0, out2 = 0, out3 = 0;
int qOut1 = 0, rOut1 = 0, qOut2 = 0, rOut2 = 0, qOut3 = 0, rOut3 = 0;
int qBlockHome1 = 0, rBlockHome1 = 0, qBlockHome2 = 0, rBlockHome2 = 0;
int qChg1 = 0,
    rChg1 = 0,
    qChg2 = 0,
    rChg2 = 0,
    qChg3 = 0,
    rChg3 = 0,
    qChg4 = 0,
    rChg4 = 0,
    qChg5 = 0,
    rChg5 = 0,
    qChg6 = 0,
    rChg6 = 0;
int qEnd1 = 0,
    rEnd1 = 0,
    qEnd2 = 0,
    rEnd2 = 0,
    qEnd3 = 0,
    rEnd3 = 0,
    qEnd4 = 0,
    rEnd4 = 0,
    qEnd5 = 0,
    rEnd5 = 0,
    qEnd6 = 0,
    rEnd6 = 0;
int qEnd = 0, rEnd = 0;
StreamController<int> controllerTile = StreamController<int>.broadcast();
StreamController<int> controllerBee = StreamController<int>.broadcast();
StreamController<bool> gamePlay = StreamController<bool>.broadcast();
int beeMove = 0;
int tileMove = 0;
StopWatchTimer stopWatchTimer = StopWatchTimer(
  mode: StopWatchMode.countUp,
);
