import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';

class DashboardScaffoldVM extends ChangeNotifier {
  final FlutterLocalization _localization;

  late String _currentPage;

  DashboardScaffoldVM({
    required FlutterLocalization localization,
  }) : _localization = localization;

  String get selectedLanguage => _localization.currentLocale!.languageCode;
  String get currentPage => _currentPage;

  void changeLanguage(String languageCode) {
    _localization.translate(languageCode);
    notifyListeners();
  }

  void setCurrentPage(String page) {
    _currentPage = page;
    notifyListeners();
  }
}

enum Selection { home, page1, page2 }
