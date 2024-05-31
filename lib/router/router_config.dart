import 'package:flutter_weather/core/dependencies/viewmodels.dart';
import 'package:flutter_weather/features/_shared/pages/not_found_page.dart';
import 'package:flutter_weather/features/weather/presentation/first/first_page.dart';
import 'package:flutter_weather/features/weather/presentation/first/first_page_viewmodel.dart';
import 'package:flutter_weather/features/weather/presentation/second/second_child_page.dart';
import 'package:flutter_weather/features/weather/presentation/weather_info/weather_page.dart';
import 'package:flutter_weather/features/weather/presentation/weather_info/weather_page_viewmodel.dart';
import 'package:flutter_weather/router/route_name.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../features/weather/presentation/second/second_page.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RouteName.home,
  routes: [
    GoRoute(
      name: RouteName.home,
      path: RouteName.home,
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => viewModels.get<WeatherPageVM>(),
        child: const WeatherPage(),
      ),
    ),
    GoRoute(
      name: RouteName.first,
      path: "${RouteName.first}/:id",
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return id == null || id.isEmpty
            ? const NotFoundPage()
            : ChangeNotifierProvider(
                create: (_) => viewModels.get<FirstPageVM>(),
                child: FirstPage(id: id),
              );
      },
    ),
    GoRoute(
      name: RouteName.second,
      path: RouteName.second,
      builder: (context, state) {
        final movie = state.uri.queryParameters['movie'];
        final anime = state.uri.queryParameters['anime'];
        return SecondPage(
          movie: movie,
          anime: anime,
        );
      },
      routes: [
        GoRoute(
          name: RouteName.secondChild,
          path: RouteName.secondChild,
          builder: (context, state) {
            return const SecondChildPage();
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
