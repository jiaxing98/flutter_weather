import 'package:flutter/material.dart';
import 'package:flutter_weather/core/utils/api_consumer.dart';
import 'package:flutter_weather/features/weather/presentation/pages/weather_page_viewmodel.dart';
import 'package:flutter_weather/features/weather/presentation/widgets/city_name_textfield.dart';
import 'package:flutter_weather/features/weather/presentation/widgets/weather_table.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1d1e22),
        title: const Text(
          'WEATHER',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                  onLoading: (ctx, value, child) => CircularProgressIndicator(),
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

  Widget _buildErrorView(String message) {
    return Center(
      child: Text(message),
    );
  }
}
