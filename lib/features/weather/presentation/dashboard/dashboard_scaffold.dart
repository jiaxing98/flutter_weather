import 'package:flutter/material.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/change_language_menu.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/dashboard_scaffold_viewmodel.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/weather_drawer.dart';
import 'package:provider/provider.dart';

class DashboardScaffold extends StatefulWidget {
  final Widget appBarTitle;
  final Widget child;

  const DashboardScaffold({
    super.key,
    required this.appBarTitle,
    required this.child,
  });

  @override
  State<DashboardScaffold> createState() => _DashboardScaffoldState();
}

class _DashboardScaffoldState extends State<DashboardScaffold> {
  @override
  void initState() {
    final vm = context.read<DashboardScaffoldVM>();
    // final currentPage = GoRouterState.of(context).uri.toString();
    // vm.setCurrentPage(currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: widget.appBarTitle,
        centerTitle: true,
        actions: const [
          ChangeLanguageMenu(),
        ],
      ),
      drawer: const WeatherDrawer(),
      body: widget.child,
    );
  }
}
