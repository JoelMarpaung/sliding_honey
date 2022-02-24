import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.transparent,
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Image(
          image: AssetImage("/images/tutorial.png"),
        ),
      ),
    );
  }
}
