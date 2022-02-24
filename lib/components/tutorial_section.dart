import 'package:flutter/material.dart';
import '../../layout/layout.dart';

class TutorialSection extends StatelessWidget {
  const TutorialSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Tutorial",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            ResponsiveGap(
              small: 10,
              medium: 15,
              large: 20,
            ),
            Text(
              "1. Press the hexagon tile to move the tile between the hexagon grid.",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "2. Try to move the arrow tile to the bee, so the bee can move according to the arrow direction.",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "3. The bee must be moved to the house to win the game.",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "4. The red obstacles can block the bee to get to the house and the tile can't be moved.",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "5. Watch out for the green obstacles, it can teleport you back to the center.",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              "6. Beware for the blue obstacles, it can teleport you to the corner of the house.",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
