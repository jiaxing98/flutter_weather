import 'package:flutter/material.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/dashboard_scaffold.dart';
import 'package:flutter_weather/features/weather/presentation/first/first_page_viewmodel.dart';
import 'package:flutter_weather/router/route_name.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  final String id;

  const FirstPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.read<FirstPageVM>();

    return DashboardScaffold(
      appBarTitle: Text("First Page"),
      child: Center(
        child: Column(
          children: [
            Text("Id: $id"),
            OutlinedButton(
              child: Text("To Second Child"),
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
