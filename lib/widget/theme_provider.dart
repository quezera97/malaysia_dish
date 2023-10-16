import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  late bool _isDarkModeEnabled;

  ThemeProvider() {
    _isDarkModeEnabled =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  }

  ThemeData get currentTheme =>
      _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light();

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  void toggleTheme() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    notifyListeners();
  }
}
