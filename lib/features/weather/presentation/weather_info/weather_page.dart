import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_weather/core/translations/app_locale.dart';
import 'package:flutter_weather/core/utils/api_consumer.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/dashboard_scaffold.dart';
import 'package:flutter_weather/features/weather/presentation/weather_info/city_name_text_field.dart';
import 'package:flutter_weather/features/weather/presentation/weather_info/weather_page_viewmodel.dart';
import 'package:flutter_weather/features/weather/presentation/weather_info/weather_table.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardScaffold(
      appBarTitle: Text(
        AppLocale.title.getString(context),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Consumer<WeatherPageVM>(
            builder: (ctx, vm, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CityNameTextField(
                  onSearch: vm.getWeatherData,
                ),
                const SizedBox(height: 32.0),
                ApiConsumer<WeatherPageVM>(
                  onInit: (ctx, value, child) => Container(),
                  onLoading: (ctx, value, child) =>
                      const CircularProgressIndicator(),
                  onError: (ctx, value, ex, child) => Center(
                    child: Text(ex.message),
                  ),
                  onCompleted: (ctx, value, child) =>
                      WeatherTable(weather: value.weather),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
