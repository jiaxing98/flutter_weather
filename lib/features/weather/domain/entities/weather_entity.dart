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

  factory WeatherEntity.fromModel(WeatherModel model) => WeatherEntity(
        cityName: model.cityName!,
        main: model.main!,
        description: model.description!,
        iconCode: model.iconCode!,
        temperature: model.temperature!,
        pressure: model.pressure!,
        humidity: model.humidity!,
      );

  WeatherModel toModel() => WeatherModel(
        cityName: cityName,
        main: main,
        description: description,
        iconCode: iconCode,
        temperature: temperature,
        pressure: pressure,
        humidity: humidity,
      );
}
