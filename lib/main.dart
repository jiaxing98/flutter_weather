import 'package:flutter/material.dart';
import 'package:flutter_weather/core/dependencies/data_source_collection.dart';
import 'package:flutter_weather/core/dependencies/repository_collection.dart';
import 'package:flutter_weather/core/dependencies/usecase_collection.dart';
import 'package:flutter_weather/core/dependencies/viewmodel_collection.dart';
import 'package:flutter_weather/features/weather/presentation/pages/weather_page.dart';
import 'package:flutter_weather/features/weather/presentation/pages/weather_page_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _injectDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => viewModel.get<WeatherPageVM>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WeatherPage(),
      ),
    );
  }

  void _injectDependencies() {
    dataSource.setup();
    repository.setup();
    usecase.setup();
    viewModel.setup();
  }
}
