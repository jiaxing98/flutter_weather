import 'package:flutter/material.dart';
import 'package:flutter_weather/core/themes/theme_provider.dart';
import 'package:provider/provider.dart';

enum _Selection { page1, page2 }

class WeatherDrawer extends StatefulWidget {
  const WeatherDrawer({super.key});

  @override
  State<WeatherDrawer> createState() => _WeatherDrawerState();
}

class _WeatherDrawerState extends State<WeatherDrawer> {
  _Selection _selected = _Selection.page1;

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
                  selected: _selected == _Selection.page1,
                  title: Text("Page 1"),
                  onTap: () {
                    setState(() {
                      _selected = _Selection.page1;
                    });
                  },
                ),
                ListTile(
                  selected: _selected == _Selection.page2,
                  title: Text("Page 2"),
                  onTap: () {
                    setState(() {
                      _selected = _Selection.page2;
                    });
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
