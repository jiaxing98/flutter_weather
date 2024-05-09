import 'package:flutter/material.dart';
import 'package:flutter_weather/core/translations/app_locale.dart';
import 'package:flutter_weather/features/weather/presentation/widgets/language_tile.dart';
import 'package:flutter_weather/main.dart';

class ChangeLanguageMenu extends StatefulWidget {
  const ChangeLanguageMenu({super.key});

  @override
  State<ChangeLanguageMenu> createState() => _ChangeLanguageMenuState();
}

class _ChangeLanguageMenuState extends State<ChangeLanguageMenu> {
  String? selectedLanguage;

  @override
  void initState() {
    selectedLanguage = localization.currentLocale?.languageCode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text(
              "Change Language",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                LanguageTile(
                  selectedLanguage: selectedLanguage!,
                  languageCode: AppLocale.en,
                  label: 'English',
                  onTap: () => _onTranslate(AppLocale.en),
                ),
                LanguageTile(
                  selectedLanguage: selectedLanguage!,
                  languageCode: AppLocale.zh,
                  label: '简体中文',
                  onTap: () => _onTranslate(AppLocale.zh),
                ),
              ],
            ),
          ),
        );
      },
      icon: const Icon(
        Icons.language,
        color: Colors.white,
      ),
    );
  }

  void _onTranslate(String languageCode) {
    setState(() {
      selectedLanguage = languageCode;
      localization.translate(languageCode);
    });
  }
}
