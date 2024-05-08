import 'package:flutter_weather/features/weather/data/models/weather_model.dart';

class WeatherEntity {
  final String cityName;
  final String main;
  final String description;
  final double temperature;
  final int pressure;
  final int humidity;

  const WeatherEntity({
    required this.cityName,
    required this.main,
    required this.description,
    required this.temperature,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherEntity.fromModel(WeatherModel model) {
    return WeatherEntity(
      cityName: model.name ?? "",
      main: model.weather?.first.main ?? "",
      description: model.weather?.first.description ?? "",
      temperature: model.main?.temp ?? 0.0,
      pressure: model.main?.pressure ?? -1,
      humidity: model.main?.humidity ?? -1,
    );
  }
}
