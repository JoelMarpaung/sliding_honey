import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../colors/colors.dart';
import '../globals.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    String audioOn = "Audio : On";
    String audioOff = "Audio : Off";
    return SizedBox(
      width: 150,
      child: Drawer(
        backgroundColor: PuzzleColors.greenPrimary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: null,
            ),
            ListTile(
              title: const Text('Home',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                context.go('/');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Easy',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                context.go('/easy');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Medium',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                context.go('/medium');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Hard',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                context.go('/hard');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: audio == true
                  ? Text(audioOn,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                  : Text(audioOff,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
              onTap: () {
                setState(() {
                  if (audio) {
                    audio = false;
                  } else {
                    audio = true;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
