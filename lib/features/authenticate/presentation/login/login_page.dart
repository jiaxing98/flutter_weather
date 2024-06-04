import 'package:flutter/material.dart';
import 'package:flutter_weather/features/authenticate/presentation/login/login_page_viewmodel.dart';
import 'package:flutter_weather/router/route_name.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => _login(context),
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    final vm = context.read<LoginPageVM>();
    final result = vm.login();
    if (!result) return;

    context.goNamed(RouteName.home);
  }
}
