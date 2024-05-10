import 'package:flutter/material.dart';
import 'package:flutter_weather/core/themes/theme_halloween.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedPreferences prefs;
  late ThemeData currentTheme;

  static const String _IS_DARK_THEME = "isDarkTheme";
  bool _isDarkTheme = true;

  ThemeProvider({required this.prefs}) {
    _isDarkTheme = prefs.getBool(_IS_DARK_THEME) ?? true;
    currentTheme =
        _isDarkTheme ? HalloweenTheme.darkTheme : HalloweenTheme.lightTheme;
  }

  bool get isDarkTheme => _isDarkTheme;

  void setLightMode() async {
    currentTheme = HalloweenTheme.lightTheme;
    _isDarkTheme = false;
    prefs.setBool(_IS_DARK_THEME, false);
    notifyListeners();
  }

  void setDarkMode() {
    currentTheme = HalloweenTheme.darkTheme;
    _isDarkTheme = true;
    prefs.setBool(_IS_DARK_THEME, true);
    notifyListeners();
  }
}
