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
StreamController<int> controllerTile = StreamController<int>.broadcast();
StreamController<int> controllerBee = StreamController<int>.broadcast();
StreamController<bool> gamePlay = StreamController<bool>.broadcast();
int beeMove = 0;
int tileMove = 0;
StopWatchTimer stopWatchTimer = StopWatchTimer(
  mode: StopWatchMode.countUp,
);
