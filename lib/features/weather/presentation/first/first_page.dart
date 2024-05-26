import 'package:flutter/material.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/dashboard_scaffold.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardScaffold(
      appBarTitle: Text("First Page"),
      child: Center(
        child: Text("This is First Page"),
      ),
    );
  }
}
