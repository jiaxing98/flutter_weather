import 'package:flutter/material.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/dashboard_scaffold.dart';
import 'package:flutter_weather/router/route_name.dart';
import 'package:go_router/go_router.dart';

class SecondPage extends StatelessWidget {
  final String? movie;
  final String? anime;

  const SecondPage({
    super.key,
    required this.movie,
    required this.anime,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardScaffold(
      appBarTitle: Text("Second Page"),
      child: Center(
        child: Column(
          children: [
            if (movie != null) Text(movie!),
            if (anime != null) Text(anime!),
            OutlinedButton(
              child: Text("To Child"),
              onPressed: () {
                context.pushNamed(RouteName.secondChild);
              },
            ),
          ],
        ),
      ),
    );
  }
}
