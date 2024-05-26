import 'package:flutter/material.dart';
import 'package:flutter_weather/core/themes/theme_provider.dart';
import 'package:flutter_weather/router/route_name.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

enum _Selection { home, page1, page2 }

class WeatherDrawer extends StatefulWidget {
  const WeatherDrawer({super.key});

  @override
  State<WeatherDrawer> createState() => _WeatherDrawerState();
}

class _WeatherDrawerState extends State<WeatherDrawer> {
  _Selection _selected = _Selection.home;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ListTile(
                  selected: _selected == _Selection.home,
                  title: Text("Home"),
                  onTap: () {
                    setState(() {
                      _selected = _Selection.home;
                    });
                    context.go(RouteName.home);
                  },
                ),
                ListTile(
                  selected: _selected == _Selection.page1,
                  title: Text("Page 1"),
                  onTap: () {
                    setState(() {
                      _selected = _Selection.page1;
                    });
                    context.go(RouteName.first);
                  },
                ),
                ListTile(
                  selected: _selected == _Selection.page2,
                  title: Text("Page 2"),
                  onTap: () {
                    setState(() {
                      _selected = _Selection.page2;
                    });
                    context.go(RouteName.second);
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
