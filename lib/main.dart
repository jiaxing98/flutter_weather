import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_weather/core/dependencies/data_sources.dart';
import 'package:flutter_weather/core/dependencies/repositories.dart';
import 'package:flutter_weather/core/dependencies/usecases.dart';
import 'package:flutter_weather/core/dependencies/utils.dart';
import 'package:flutter_weather/core/dependencies/viewmodels.dart';
import 'package:flutter_weather/core/themes/theme_provider.dart';
import 'package:flutter_weather/core/translations/app_locale.dart';
import 'package:flutter_weather/features/weather/presentation/pages/weather_page.dart';
import 'package:flutter_weather/features/weather/presentation/pages/weather_page_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // inject dependencies
  injectUtils();
  injectDataSources();
  injectRepositories();
  injectUseCases();
  injectViewModels();

  final prefs = await utils.getAsync<SharedPreferences>();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(prefs: prefs),
      child: const MyApp(),
    ),
  );
}

final FlutterLocalization localization = utils.get<FlutterLocalization>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _setupLocalization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => viewModels.get<WeatherPageVM>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<ThemeProvider>(context).currentTheme,
        supportedLocales: localization.supportedLocales,
        localizationsDelegates: localization.localizationsDelegates,
        home: const WeatherPage(),
      ),
    );
  }

  void _setupLocalization() {
    localization.init(
      mapLocales: [
        const MapLocale(AppLocale.en, AppLocale.EN),
        const MapLocale(AppLocale.zh, AppLocale.ZH),
      ],
      initLanguageCode: AppLocale.en,
    );
    localization.onTranslatedLanguage = (locale) => setState(() {});
  }
}
