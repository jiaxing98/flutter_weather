import 'package:flutter/material.dart';
import 'package:flutter_weather/core/translations/app_locale.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/dashboard_scaffold_viewmodel.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/language_tile.dart';
import 'package:provider/provider.dart';

class ChangeLanguageMenu extends StatelessWidget {
  const ChangeLanguageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<DashboardScaffoldVM>();

    return IconButton(
      onPressed: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          pageBuilder: (ctx, anim, secondaryAnim) => AlertDialog(
            title: const Text(
              "Change Language",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Selector<DashboardScaffoldVM, String>(
                  selector: (ctx, vm) => vm.selectedLanguage,
                  builder: (ctx, value, _) => LanguageTile(
                    selectedLanguage: value,
                    languageCode: AppLocale.en,
                    label: 'English',
                    onTap: () {
                      vm.changeLanguage(AppLocale.en);
                      Navigator.of(ctx).pop();
                    },
                  ),
                ),
                Selector<DashboardScaffoldVM, String>(
                  selector: (ctx, vm) => vm.selectedLanguage,
                  builder: (ctx, value, _) => LanguageTile(
                    selectedLanguage: value,
                    languageCode: AppLocale.zh,
                    label: '简体中文',
                    onTap: () {
                      vm.changeLanguage(AppLocale.zh);
                      Navigator.of(ctx).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      icon: const Icon(Icons.language),
    );
  }
}
