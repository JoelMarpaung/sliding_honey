import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import '../globals.dart';

class PuzzleBoardHoney extends StatefulWidget {
  final double size;
  const PuzzleBoardHoney(
      {Key? key,
      required this.size,
      required this.controllerTile1,
      required this.controllerBee2})
      : super(key: key);
  final StreamController<int> controllerTile1;
  final StreamController<int> controllerBee2;
  @override
  State<PuzzleBoardHoney> createState() => _PuzzleBoardHoneyState();
}

class _PuzzleBoardHoneyState extends State<PuzzleBoardHoney>
    with SingleTickerProviderStateMixin {
  var random = Random();
  var arrayQR = [
    {'q': -1, 'r': -3},
    {'q': -2, 'r': -2},
    {'q': -3, 'r': -1},
    {'q': -4, 'r': 1},
    {'q': -4, 'r': 2},
    {'q': -4, 'r': 3},
    {'q': -3, 'r': 4},
    {'q': -2, 'r': 4},
    {'q': -1, 'r': 4},
    {'q': 1, 'r': 3},
    {'q': 2, 'r': 2},
    {'q': 3, 'r': 1},
    {'q': 4, 'r': -1},
    {'q': 4, 'r': -2},
    {'q': 4, 'r': -3},
    {'q': 3, 'r': -4},
    {'q': 2, 'r': -4},
    {'q': 1, 'r': -4}
  ];
  var arrayOutQR = [
    {'q': 0, 'r': -4},
    {'q': -4, 'r': 0},
    {'q': -4, 'r': 4},
    {'q': 0, 'r': 4},
    {'q': 4, 'r': 0},
    {'q': 4, 'r': -4}
  ];
  int _tileMove = 1;
  int _beeMove = 1;
  @override
  void initState() {
    if (!puzzleInitiated) {
      q = 0;
      r = 0;
      setOut();
      updateArrows();
      puzzleInitiated = true;
    }
    super.initState();
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
        cornerRadius: 10.0,
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
                        width: 200,
                        height: 200,
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
                            (r - coordinates.r).abs() < 2)) {
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
                            widget.controllerBee2.add(_beeMove++);
                          }
                        } else if (arrow == arr2) {
                          if (qChar == qArr2 && rChar == rArr2) {
                            moveBee();
                            updateArrows();
                            widget.controllerBee2.add(_beeMove++);
                          }
                        } else if (arrow == arr3) {
                          if (qChar == qArr3 && rChar == rArr3) {
                            moveBee();
                            updateArrows();
                            controllerBee.add(_beeMove++);
                          }
                        }
                        if ((qChar == qOut1 && rChar == rOut1) ||
                            (qChar == qOut2 && rChar == rOut2) ||
                            (qChar == qOut3 && rChar == rOut3)) {
                          print('Succes');
                        }
                        q = coordinates.q;
                        r = coordinates.r;
                        controllerTile.add(_tileMove++);
                      });
                    }
                  },
                ),
        ),
      ),
    );
  }

  showItem(int qMain, int rMain) {
    if (qMain == qChar && rMain == rChar) {
      return const Icon(
        Icons.favorite,
        size: 35,
      );
    } else if (qMain == qArr1 && rMain == rArr1) {
      return const Icon(
          Icons.ac_unit); //Text('$arr1', style: const TextStyle(fontSize: 30));
    } else if (qMain == qArr2 && rMain == rArr2) {
      return const Icon(
          Icons.ac_unit); //Text('$arr2', style: const TextStyle(fontSize: 30));
    } else if (qMain == qArr3 && rMain == rArr3) {
      return const Icon(
          Icons.ac_unit); //Text('$arr3', style: const TextStyle(fontSize: 30));
    } else if (qMain == qOut1 && rMain == rOut1) {
      return const Icon(Icons.home);
    } else if (qMain == qOut2 && rMain == rOut2) {
      return const Icon(Icons.home);
    } else if (qMain == qOut3 && rMain == rOut3) {
      return const Icon(Icons.home);
    }
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
}
