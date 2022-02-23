import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../globals.dart';
import '../models/qr_model.dart';

class PuzzleBoardHoneyHard extends StatefulWidget {
  final double size;
  const PuzzleBoardHoneyHard(
      {Key? key,
      required this.size,
      required this.controllerTile,
      required this.controllerBee})
      : super(key: key);
  final StreamController<int> controllerTile;
  final StreamController<int> controllerBee;
  @override
  State<PuzzleBoardHoneyHard> createState() => _PuzzleBoardHoneyHardState();
}

class _PuzzleBoardHoneyHardState extends State<PuzzleBoardHoneyHard>
    with SingleTickerProviderStateMixin {
  final Stream<bool> _gamePlay = gamePlay.stream;
  late StreamSubscription<bool> streamSubscriptionGame;
  var random = Random();

  @override
  void initState() {
    setState(() {
      if (!puzzleInitiated) {
        q = 0;
        r = 0;
        setOut();
        updateArrows();
        updateChanges();
        puzzleInitiated = true;
      }

      streamSubscriptionGame = _gamePlay.listen((gamePlay) {
        if (gameStarted == true) {
          replay();
        }
      });
    });
    super.initState();
  }

  void replay() {
    setState(() {
      q = 0;
      r = 0;
      qChar = 0;
      rChar = 0;
      setOut();
      updateArrows();
      updateChanges();
    });
  }

  @override
  void dispose() {
    streamSubscriptionGame.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HexagonGrid(
      width: widget.size,
      hexType: HexagonType.FLAT,
      color: Colors.transparent,
      depth: 4,
      buildTile: (coordinates) => HexagonWidgetBuilder(
        padding: 2,
        cornerRadius: 5.0,
        elevation: 10,
        color: Colors.yellow.shade100,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: coordinates.q == q && coordinates.r == r
              ? HexagonWidget.flat(
                  width: 200,
                  color: Colors.yellow.shade100,
                  inBounds: false,
                  child: showItem(coordinates.q, coordinates.r),
                )
              : GestureDetector(
                  child: HexagonWidget.flat(
                    width: 100,
                    color: Colors.amberAccent,
                    inBounds: false,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              Colors.yellow,
                              Colors.amberAccent,
                              Colors.orange
                            ],
                            center: Alignment(0.6, -0.3),
                            focal: Alignment(0.3, -0.1),
                          ),
                        ),
                        child: showItem(coordinates.q, coordinates.r),
                      ),
                    ),
                  ),
                  onTap: () {
                    if ((((q + r) - (coordinates.q + coordinates.r)).abs() <
                            2) &&
                        ((q - coordinates.q).abs() < 2 &&
                            (r - coordinates.r).abs() < 2) &&
                        gameStarted == true) {
                      if (!(coordinates.q == qBlockHome1 &&
                          coordinates.r == rBlockHome1)) {
                        setState(() {
                          if (qArr1 == coordinates.q &&
                              rArr1 == coordinates.r) {
                            qArr1 = q;
                            rArr1 = r;
                            arrow = arr1;
                          } else if (qArr2 == coordinates.q &&
                              rArr2 == coordinates.r) {
                            qArr2 = q;
                            rArr2 = r;
                            arrow = arr2;
                          }
                          if (arrow == arr1) {
                            if (qChar == qArr1 && rChar == rArr1) {
                              moveBee();
                              updateArrows();
                              updateChanges();
                              widget.controllerBee.add(++beeMove);
                            }
                          } else if (arrow == arr2) {
                            if (qChar == qArr2 && rChar == rArr2) {
                              moveBee();
                              updateArrows();
                              updateChanges();
                              widget.controllerBee.add(++beeMove);
                            }
                          }
                          if ((qChar == qOut1 && rChar == rOut1)) {
                            onComplete();
                          }
                          q = coordinates.q;
                          r = coordinates.r;
                          controllerTile.add(++tileMove);
                        });
                      }
                    }
                  },
                ),
        ),
      ),
    );
  }

  showItem(int qMain, int rMain) {
    if (qMain == qChar && rMain == rChar) {
      return const Icon(Icons.bug_report_outlined, size: 35);
    } else if (qMain == qArr1 && rMain == rArr1) {
      return iconArrow(
          arr1); //Text('$arr1', style: const TextStyle(fontSize: 30));
    } else if (qMain == qArr2 && rMain == rArr2) {
      return iconArrow(
          arr2); //Text('$arr2', style: const TextStyle(fontSize: 30));
    } else if (qMain == qOut1 && rMain == rOut1) {
      return const Icon(Icons.home_outlined, size: 35);
    } else if (qMain == qBlockHome1 && rMain == rBlockHome1) {
      return const Icon(
        Icons.coronavirus_sharp,
        size: 35,
        color: Colors.red,
      );
    } else if ((qMain == qChg1 && rMain == rChg1) ||
        (qMain == qChg2 && rMain == rChg2) ||
        (qMain == qChg3 && rMain == rChg3) ||
        (qMain == qChg4 && rMain == rChg4)) {
      return const Icon(Icons.change_circle_outlined,
          size: 35, color: Colors.green);
    } else if ((qMain == qEnd1 && rMain == rEnd1) ||
        (qMain == qEnd2 && rMain == rEnd2) ||
        (qMain == qEnd3 && rMain == rEnd3) ||
        (qMain == qEnd4 && rMain == rEnd4)) {
      return const Icon(Icons.catching_pokemon_outlined,
          size: 35, color: Colors.indigo);
    }
  }

  Widget iconArrow(int arrow) {
    double _angle = 0;
    if (arrow == 0) {
      _angle = 4.7;
    } else if (arrow == 1) {
      _angle = 5.6;
    } else if (arrow == 2) {
      _angle = 0.4;
    } else if (arrow == 3) {
      _angle = 1.6;
    } else if (arrow == 4) {
      _angle = 2.5;
    } else if (arrow == 5) {
      _angle = 3.7;
    }
    return Transform.rotate(
        angle: _angle,
        child: const Icon(
          Icons.arrow_right_alt_outlined,
          size: 35,
        ));
  }

  moveBee() {
    // Notes for moving bee
    // 0 (Up Arrow)         > q = q; r = r - 1;
    // 1 (Up Right Arrow)   > q = q + 1; r = r - 1;
    // 2 (Down Right Arrow) > q = q + 1; r = r;
    // 3 (Down Arrow)       > q = q; r = r + 1;
    // 4 (Down Left Arrow)  > q = q - 1; r = r + 1;
    // 5 (Up Left Arrow)    > q = q - 1; r = r;
    int curQChar = qChar;
    int curRChar = rChar;
    int sChar = 0;
    if (arrow == 0) {
      qChar = qChar;
      rChar = rChar - 1;
    } else if (arrow == 1) {
      qChar = qChar + 1;
      rChar = rChar - 1;
    } else if (arrow == 2) {
      qChar = qChar + 1;
      rChar = rChar;
    } else if (arrow == 3) {
      qChar = qChar;
      rChar = rChar + 1;
    } else if (arrow == 4) {
      qChar = qChar - 1;
      rChar = rChar + 1;
    } else if (arrow == 5) {
      qChar = qChar - 1;
      rChar = rChar;
    }
    sChar = -qChar - rChar;
    if (qChar.abs() >= 5 || rChar.abs() >= 5 || sChar.abs() >= 5) {
      qChar = curQChar;
      rChar = curRChar;
    } else if ((qChar == qBlockHome1 && rChar == rBlockHome1)) {
      qChar = curQChar;
      rChar = curRChar;
    } else if ((qChar == qChg1 && rChar == rChg1) ||
        (qChar == qChg2 && rChar == rChg2) ||
        (qChar == qChg3 && rChar == rChg3) ||
        (qChar == qChg4 && rChar == rChg4)) {
      qChar = 0;
      rChar = 0;
    } else if ((qChar == qEnd1 && rChar == rEnd1) ||
        (qChar == qEnd2 && rChar == rEnd2) ||
        (qChar == qEnd3 && rChar == rEnd3) ||
        (qChar == qEnd4 && rChar == rEnd4)) {
      qChar = qEnd;
      rChar = rEnd;
    }
  }

  setOut() {
    int indexQR1 = random.nextInt(5);
    var qrResult = arrayOutQR.elementAt(indexQR1);
    qOut1 = qrResult['q']!;
    rOut1 = qrResult['r']!;
    var qrBlock = arrayOutBlockQR.elementAt(indexQR1);
    qBlockHome1 = qrBlock['q']!;
    rBlockHome1 = qrBlock['r']!;
    int indexQR = 0;
    if (indexQR1 == 0) {
      indexQR = 3;
    } else if (indexQR1 == 1) {
      indexQR = 4;
    } else if (indexQR1 == 2) {
      indexQR = 5;
    } else if (indexQR1 == 3) {
      indexQR = 0;
    } else if (indexQR1 == 4) {
      indexQR = 1;
    } else if (indexQR1 == 5) {
      indexQR = 2;
    }
    qrResult = arrayOutQR.elementAt(indexQR);
    qEnd = qrResult['q']!;
    rEnd = qrResult['r']!;
  }

  updateArrows() {
    int indexQR1 = random.nextInt(17);
    var qrResult = arrayQR.elementAt(indexQR1);
    qArr1 = qrResult['q']!;
    rArr1 = qrResult['r']!;
    int indexQR2 = random.nextInt(17);
    while (indexQR1 == indexQR2) {
      indexQR2 = random.nextInt(17);
    }
    qrResult = arrayQR.elementAt(indexQR2);
    qArr2 = qrResult['q']!;
    rArr2 = qrResult['r']!;

    arr1 = random.nextInt(5);
    arr2 = random.nextInt(5);
    while (arr1 == arr2) {
      arr2 = random.nextInt(5);
    }
  }

  updateChanges() {
    int indexQR1 = random.nextInt(41);
    var qrResult = arrayChangeQR.elementAt(indexQR1);
    qChg1 = qrResult['q']!;
    rChg1 = qrResult['r']!;
    int indexQR2 = random.nextInt(41);
    while (indexQR1 == indexQR2) {
      indexQR2 = random.nextInt(41);
    }
    qrResult = arrayChangeQR.elementAt(indexQR2);
    qChg2 = qrResult['q']!;
    rChg2 = qrResult['r']!;
    int indexQR3 = random.nextInt(41);
    while (indexQR1 == indexQR3 || indexQR2 == indexQR3) {
      indexQR3 = random.nextInt(41);
    }
    qrResult = arrayChangeQR.elementAt(indexQR3);
    qChg3 = qrResult['q']!;
    rChg3 = qrResult['r']!;
    int indexQR4 = random.nextInt(41);
    while (
        indexQR1 == indexQR4 || indexQR2 == indexQR4 || indexQR3 == indexQR4) {
      indexQR4 = random.nextInt(41);
    }
    qrResult = arrayChangeQR.elementAt(indexQR4);
    qChg4 = qrResult['q']!;
    rChg4 = qrResult['r']!;
    int indexQR5 = random.nextInt(41);
    while (indexQR1 == indexQR5 ||
        indexQR2 == indexQR5 ||
        indexQR3 == indexQR5 ||
        indexQR4 == indexQR5) {
      indexQR5 = random.nextInt(41);
    }
    qrResult = arrayChangeQR.elementAt(indexQR5);
    qEnd1 = qrResult['q']!;
    rEnd1 = qrResult['r']!;
    int indexQR6 = random.nextInt(41);
    while (indexQR1 == indexQR6 ||
        indexQR2 == indexQR6 ||
        indexQR3 == indexQR6 ||
        indexQR4 == indexQR6 ||
        indexQR5 == indexQR6) {
      indexQR6 = random.nextInt(41);
    }
    qrResult = arrayChangeQR.elementAt(indexQR6);
    qEnd2 = qrResult['q']!;
    rEnd2 = qrResult['r']!;
    int indexQR7 = random.nextInt(41);
    while (indexQR1 == indexQR7 ||
        indexQR2 == indexQR7 ||
        indexQR3 == indexQR7 ||
        indexQR4 == indexQR7 ||
        indexQR5 == indexQR7 ||
        indexQR6 == indexQR7) {
      indexQR7 = random.nextInt(41);
    }
    qrResult = arrayChangeQR.elementAt(indexQR7);
    qEnd3 = qrResult['q']!;
    rEnd3 = qrResult['r']!;
    int indexQR8 = random.nextInt(41);
    while (indexQR1 == indexQR8 ||
        indexQR2 == indexQR8 ||
        indexQR3 == indexQR8 ||
        indexQR4 == indexQR8 ||
        indexQR5 == indexQR8 ||
        indexQR6 == indexQR8 ||
        indexQR7 == indexQR8) {
      indexQR8 = random.nextInt(41);
    }
    qrResult = arrayChangeQR.elementAt(indexQR8);
    qEnd4 = qrResult['q']!;
    rEnd4 = qrResult['r']!;
  }

  void onComplete() {
    gameStarted = false;
    stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("CONGRATULATION !!!"),
          content: const Text(
              "You have won this level. Do you want to re-start the game?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'No'),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Yes');
                reStart();
              },
              child: const Text('Yes'),
            )
          ],
        );
      },
    );
  }

  void reStart() {
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
  }
}
