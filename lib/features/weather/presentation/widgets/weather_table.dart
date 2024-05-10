import 'package:flutter/material.dart';
import 'package:flutter_weather/core/networks/weather_api_config.dart';
import 'package:flutter_weather/features/weather/domain/entities/weather_entity.dart';

class WeatherTable extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherTable({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('weather_data'),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weather.cityName,
              style: const TextStyle(
                fontSize: 22.0,
              ),
            ),
          ],
        ),
        Image(
          image: NetworkImage(
            WeatherApiConfig.weatherIcon(
              weather.iconCode,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          '${weather.main} | ${weather.description}',
          style: const TextStyle(
            fontSize: 16.0,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 24.0),
        Table(
          defaultColumnWidth: const FixedColumnWidth(150.0),
          border: TableBorder.all(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 1,
          ),
          children: [
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Temperature',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  weather.temperature.toString(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), // Will be change later
            ]),
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Pressure',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  weather.pressure.toString(),
                  style: const TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ), // Will be change later
            ]),
            TableRow(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Humidity',
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    weather.humidity.toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
