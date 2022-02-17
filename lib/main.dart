import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'router/routes.dart';

void main() {
  final state = AppStateManager();
  runApp(SlidingHoney(appState: state));
}

class SlidingHoney extends StatelessWidget {
  final AppStateManager appState;

  const SlidingHoney({Key? key, required this.appState}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateManager>(
          lazy: false,
          create: (BuildContext createContext) => appState,
        ),
        Provider<MyRouter>(
          lazy: false,
          create: (BuildContext createContext) => MyRouter(appState),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final router = Provider.of<MyRouter>(context, listen: false).router;
          return MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            debugShowCheckedModeBanner: false,
            title: 'Sliding Honey',
          );
        },
      ),
    );
  }
}
