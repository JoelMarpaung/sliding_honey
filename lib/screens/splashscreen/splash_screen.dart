import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../layout/layout.dart';

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
      body: ResponsiveLayoutBuilder(
        small: (context, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                height: 200,
                image: AssetImage('assets/images/bee.png'),
              ),
              Text(
                'Loading ...',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        medium: (context, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                height: 300,
                image: AssetImage('assets/images/bee.png'),
              ),
              Text(
                'Loading ...',
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        large: (context, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                height: 500,
                image: AssetImage('assets/images/bee.png'),
              ),
              Text(
                'Loading ...',
                style: TextStyle(
                    fontSize: 55,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
