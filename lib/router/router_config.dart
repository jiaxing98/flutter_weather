import 'package:flutter_weather/core/dependencies/viewmodels.dart';
import 'package:flutter_weather/features/weather/presentation/first/first_page.dart';
import 'package:flutter_weather/features/weather/presentation/second/second_page.dart';
import 'package:flutter_weather/features/weather/presentation/weather_info/weather_page.dart';
import 'package:flutter_weather/features/weather/presentation/weather_info/weather_page_viewmodel.dart';
import 'package:flutter_weather/router/route_name.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RouteName.home,
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => viewModels.get<WeatherPageVM>(),
        child: const WeatherPage(),
      ),
    ),
    GoRoute(
      path: RouteName.first,
      builder: (context, state) => const FirstPage(),
    ),
    GoRoute(
      path: RouteName.second,
      builder: (context, state) => const SecondPage(),
    ),
  ],
);
