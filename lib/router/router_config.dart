import 'package:flutter/material.dart';
import 'package:flutter_weather/core/dependencies/utils.dart';
import 'package:flutter_weather/core/dependencies/viewmodels.dart';
import 'package:flutter_weather/core/utils/authenticate_helper.dart';
import 'package:flutter_weather/features/_shared/pages/not_found_page.dart';
import 'package:flutter_weather/features/authenticate/presentation/login/login_page.dart';
import 'package:flutter_weather/features/authenticate/presentation/login/login_page_viewmodel.dart';
import 'package:flutter_weather/features/weather/presentation/first/first_page.dart';
import 'package:flutter_weather/features/weather/presentation/first/first_page_viewmodel.dart';
import 'package:flutter_weather/features/weather/presentation/second/second_child_page.dart';
import 'package:flutter_weather/features/weather/presentation/second/second_page.dart';
import 'package:flutter_weather/features/weather/presentation/weather_info/weather_page.dart';
import 'package:flutter_weather/features/weather/presentation/weather_info/weather_page_viewmodel.dart';
import 'package:flutter_weather/router/route_name.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RouteName.home,
  routes: [
    GoRoute(
      name: RouteName.login,
      path: RouteName.login,
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => viewModels.get<LoginPageVM>(),
        child: const LoginPage(),
      ),
    ),
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
      pageBuilder: (context, state) {
        final id = state.pathParameters['id'];
        return CustomTransitionPage(
          key: state.pageKey,
          child: id == null || id.isEmpty
              ? const NotFoundPage()
              : ChangeNotifierProvider(
                  create: (_) => viewModels.get<FirstPageVM>(),
                  child: FirstPage(id: id),
                ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
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
      redirect: (context, state) {
        final isAuthenticated = utils.get<AuthenticateHelper>().isLoggedIn;
        return isAuthenticated ? null : RouteName.login;
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
