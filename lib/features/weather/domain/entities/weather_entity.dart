import 'package:flutter_weather/features/weather/data/models/weather_model.dart';

class WeatherEntity {
  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final double temperature;
  final int pressure;
  final int humidity;

  const WeatherEntity({
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.temperature,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherEntity.fromModel(WeatherModel model) {
    return WeatherEntity(
      cityName: model.name ?? "",
      main: model.weather?.first.main ?? "",
      description: model.weather?.first.description ?? "",
      iconCode: model.weather?.first.icon ?? "",
      temperature: model.main?.temp ?? 0.0,
      pressure: model.main?.pressure ?? -1,
      humidity: model.main?.humidity ?? -1,
    );
  }
}
