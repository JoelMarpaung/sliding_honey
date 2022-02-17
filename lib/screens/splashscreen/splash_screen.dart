import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return const MaterialPage(child: SplashScreen());
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Image(
            //   height: 200,
            //   image: AssetImage('assets/fooderlich_assets/rw_logo.png'),
            // ),
            Icon(Icons.lock_clock, size: 200),
            Text('Initializing...'),
          ],
        ),
      ),
    );
  }
}
