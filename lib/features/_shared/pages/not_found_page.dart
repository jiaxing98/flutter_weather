import 'package:flutter/material.dart';
import 'package:flutter_weather/router/route_name.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "404 Not Found",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            TextButton(
              onPressed: () {
                context.goNamed(RouteName.home);
              },
              child: Text("Back To Homepage"),
            ),
          ],
        ),
      ),
    );
  }
}
