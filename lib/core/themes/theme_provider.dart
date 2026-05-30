import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _thememode = ThemeMode.dark;
  ThemeMode get thememode => _thememode;

  void toggleTheme() {
    if (thememode == ThemeMode.dark) {
      _thememode = ThemeMode.light;
    } else {
      _thememode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
