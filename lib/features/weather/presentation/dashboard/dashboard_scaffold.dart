import 'package:flutter/material.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/change_language_menu.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/weather_drawer.dart';
import 'package:go_router/go_router.dart';

class DashboardScaffold extends StatelessWidget {
  final Widget appBarTitle;
  final Widget child;

  const DashboardScaffold({
    super.key,
    required this.appBarTitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final routeName = GoRouterState.of(context).name;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: appBarTitle,
        centerTitle: true,
        actions: const [
          ChangeLanguageMenu(),
        ],
      ),
      drawer: WeatherDrawer(routeName: routeName!),
      body: child,
    );
  }
}
