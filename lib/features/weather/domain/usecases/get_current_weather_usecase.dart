import 'package:flutter_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:flutter_weather/features/weather/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository _repository;

  GetCurrentWeatherUseCase(this._repository);

  Future<WeatherEntity> call({required String cityName}) {
    return _repository.getCurrentWeather(cityName);
  }
}
