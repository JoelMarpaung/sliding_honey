import 'dart:async';

import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool get isInitialized => _initialized;
  void initializeApp() async {
    Timer(const Duration(milliseconds: 100), () {
      _initialized = true;
      notifyListeners();
    });
  }
}
