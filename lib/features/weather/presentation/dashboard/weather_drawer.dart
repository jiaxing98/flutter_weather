import 'package:flutter/material.dart';
import 'package:flutter_weather/core/dependencies/utils.dart';
import 'package:flutter_weather/core/themes/theme_provider.dart';
import 'package:flutter_weather/core/utils/authenticate_helper.dart';
import 'package:flutter_weather/router/route_name.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class WeatherDrawer extends StatelessWidget {
  final String routeName;

  const WeatherDrawer({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    final authHelper = utils.get<AuthenticateHelper>();

    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ListTile(
                  selected: routeName == RouteName.home,
                  title: Text("Home"),
                  onTap: () {
                    context.go(RouteName.home);
                  },
                ),
                ListTile(
                  selected: routeName == RouteName.first,
                  title: Text("Page 1"),
                  onTap: () {
                    context.goNamed(
                      RouteName.first,
                      pathParameters: {"id": "1"},
                    );
                  },
                ),
                ListTile(
                  selected: routeName == RouteName.second,
                  title: Text("Page 2"),
                  onTap: () {
                    context.goNamed(
                      RouteName.second,
                      queryParameters: {
                        "movie": "inception",
                        // "anime": "gintama",
                      },
                    );
                  },
                ),
                ListTile(
                  selected: routeName == RouteName.third,
                  title: Text("Page 3"),
                  onTap: () {
                    context.go(RouteName.third);
                  },
                ),
                ListTile(
                  selected: false,
                  title: Text("Logout"),
                  onTap: () {
                    authHelper.logout();
                    context.goNamed(RouteName.home);
                  },
                ),
              ],
            ),
            Selector<ThemeProvider, bool>(
              selector: (ctx, provider) => provider.isDarkTheme,
              builder: (ctx, value, child) {
                final provider = ctx.read<ThemeProvider>();

                return ListTile(
                  leading: Icon(value ? Icons.dark_mode : Icons.light_mode),
                  trailing: Switch(
                    value: value,
                    onChanged: (value) {
                      value ? provider.setDarkMode() : provider.setLightMode();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
