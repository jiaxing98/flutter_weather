import 'package:flutter_weather/core/translations/en_locale.dart';
import 'package:flutter_weather/core/translations/zh_locale.dart';

abstract class AppLocale {
  static const String en = "en";
  static const String zh = "zh";

  static const Map<String, dynamic> EN = enLocale;
  static const Map<String, dynamic> ZH = zhLocale;

  static const String title = "title";
  static const String searchBarHint = 'searchBarHint';
}
