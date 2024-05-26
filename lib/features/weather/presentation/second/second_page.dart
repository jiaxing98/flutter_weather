import 'package:flutter/material.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/dashboard_scaffold.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardScaffold(
      appBarTitle: Text("Second Page"),
      child: Center(
        child: Text("This is Second Page"),
      ),
    );
  }
}
