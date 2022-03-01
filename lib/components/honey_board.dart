import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../globals.dart';
import '../models/qr_model.dart';
import 'package:just_audio/just_audio.dart';

class PuzzleBoardHoney extends StatefulWidget {
  final double size;
  const PuzzleBoardHoney(
      {Key? key,
      required this.size,
      required this.controllerTile,
      required this.controllerBee})
      : super(key: key);
  final StreamController<int> controllerTile;
  final StreamController<int> controllerBee;
  @override
  State<PuzzleBoardHoney> createState() => _PuzzleBoardHoneyState();
}

class _PuzzleBoardHoneyState extends State<PuzzleBoardHoney>
    with SingleTickerProviderStateMixin {
  final Stream<bool> _gamePlay = gamePlay.stream;
  late StreamSubscription<bool> streamSubscriptionGame;
  var random = Random();
  final player1 = AudioPlayer();
  final player2 = AudioPlayer();
  final player3 = AudioPlayer();
  final player4 = AudioPlayer();
  Future<void> tileSound() async {
    await player1.setAsset('assets/audio/tile_move.mp3');
    await player1.play();
  }

  Future<void> tileNotMoveSound() async {
    await player2.setAsset('assets/audio/click.mp3');
    await player2.play();
  }

  Future<void> beeMoveSound() async {
    await player3.setAsset('assets/audio/skateboard.mp3');
    await player3.play();
  }

  Future<void> completeSound() async {
    await player4.setAsset('assets/audio/success.mp3');
    await player4.play();
  }

  @override
  void initState() {
    setState(() {
      if (!puzzleInitiated) {
        q = 0;
        r = 0;
        setOut();
        updateArrows();
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
                      setState(() {
                        if (qArr1 == coordinates.q && rArr1 == coordinates.r) {
                          qArr1 = q;
                          rArr1 = r;
                          arrow = arr1;
                        } else if (qArr2 == coordinates.q &&
                            rArr2 == coordinates.r) {
                          qArr2 = q;
                          rArr2 = r;
                          arrow = arr2;
                        } else if (qArr3 == coordinates.q &&
                            rArr3 == coordinates.r) {
                          qArr3 = q;
                          rArr3 = r;
                          arrow = arr3;
                        }
                        if (arrow == arr1) {
                          if (qChar == qArr1 && rChar == rArr1) {
                            moveBee();
                            updateArrows();
                            widget.controllerBee.add(++beeMove);
                            if (audio) {
                              beeMoveSound();
                            }
                          }
                        } else if (arrow == arr2) {
                          if (qChar == qArr2 && rChar == rArr2) {
                            moveBee();
                            updateArrows();
                            widget.controllerBee.add(++beeMove);
                            if (audio) {
                              beeMoveSound();
                            }
                          }
                        } else if (arrow == arr3) {
                          if (qChar == qArr3 && rChar == rArr3) {
                            moveBee();
                            updateArrows();
                            controllerBee.add(++beeMove);
                            if (audio) {
                              beeMoveSound();
                            }
                          }
                        }
                        if ((qChar == qOut1 && rChar == rOut1) ||
                            (qChar == qOut2 && rChar == rOut2) ||
                            (qChar == qOut3 && rChar == rOut3)) {
                          onComplete();
                          if (audio) {
                            completeSound();
                          }
                        }
                        q = coordinates.q;
                        r = coordinates.r;
                        controllerTile.add(++tileMove);
                        if (audio) {
                          tileSound();
                        }
                      });
                    } else {
                      if (audio) {
                        tileNotMoveSound();
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
    } else if (qMain == qArr3 && rMain == rArr3) {
      return iconArrow(
          arr3); //Text('$arr3', style: const TextStyle(fontSize: 30));
    } else if (qMain == qOut1 && rMain == rOut1) {
      return const Icon(Icons.home_outlined, size: 35);
    } else if (qMain == qOut2 && rMain == rOut2) {
      return const Icon(Icons.home_outlined, size: 35);
    } else if (qMain == qOut3 && rMain == rOut3) {
      return const Icon(Icons.home_outlined, size: 35);
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
    }
  }

  setOut() {
    int indexQR1 = random.nextInt(5);
    var qrResult = arrayOutQR.elementAt(indexQR1);
    qOut1 = qrResult['q']!;
    rOut1 = qrResult['r']!;
    int indexQR2 = random.nextInt(5);
    while (indexQR1 == indexQR2) {
      indexQR2 = random.nextInt(5);
    }
    qrResult = arrayOutQR.elementAt(indexQR2);
    qOut2 = qrResult['q']!;
    rOut2 = qrResult['r']!;
    int indexQR3 = random.nextInt(5);
    while (indexQR1 == indexQR3 || indexQR2 == indexQR3) {
      indexQR3 = random.nextInt(5);
    }
    qrResult = arrayOutQR.elementAt(indexQR3);
    qOut3 = qrResult['q']!;
    rOut3 = qrResult['r']!;
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
    int indexQR3 = random.nextInt(17);
    while (indexQR1 == indexQR3 || indexQR2 == indexQR3) {
      indexQR3 = random.nextInt(17);
    }
    qrResult = arrayQR.elementAt(indexQR3);
    qArr3 = qrResult['q']!;
    rArr3 = qrResult['r']!;
    arr1 = random.nextInt(5);
    arr2 = random.nextInt(5);
    while (arr1 == arr2) {
      arr2 = random.nextInt(5);
    }
    arr3 = random.nextInt(5);
    while (arr1 == arr3 || arr2 == arr3) {
      arr3 = random.nextInt(5);
    }
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
