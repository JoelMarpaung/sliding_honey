import 'package:flutter/material.dart';
import '../screens/screens.dart';
import 'package:go_router/go_router.dart';
import '../models/models.dart';

class MyRouter {
  // 1
  final AppStateManager appState;
  MyRouter(this.appState);

  // 2
  late final router = GoRouter(
    // 3
    refreshListenable: appState,
    // // 4
    debugLogDiagnostics: true,
    // // 5
    urlPathStrategy: UrlPathStrategy.path,

    // 6
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: 'splash',
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'easy',
        path: '/easy',
        builder: (context, state) => const EasyLevelScreen(),
      ),
      GoRoute(
        name: 'medium',
        path: '/medium',
        builder: (context, state) => const MediumLevelScreen(),
      ),
      GoRoute(
        name: 'hard',
        path: '/hard',
        builder: (context, state) => const HardLevelScreen(),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorPage(error: state.error),
    ),
    redirect: (state) {
      final splashLoc = state.namedLocation('splash');
      final splashScreen = state.subloc == splashLoc;
      final initialized = appState.isInitialized;
      final rootLoc =
          state.namedLocation('medium'); //state.namedLocation('home');

      if (!initialized && !splashScreen) return splashLoc;
      if (initialized && splashScreen) return rootLoc;
      return null;
    },
  );
}
