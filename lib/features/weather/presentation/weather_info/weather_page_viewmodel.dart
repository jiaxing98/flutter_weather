import 'package:flutter_weather/core/utils/api_change_notifier.dart';
import 'package:flutter_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:flutter_weather/features/weather/domain/usecases/get_current_weather_usecase.dart';

class WeatherPageVM extends ApiChangeNotifier {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  late WeatherEntity weather;

  WeatherPageVM({required GetCurrentWeatherUseCase getCurrentWeatherUseCase})
      : _getCurrentWeatherUseCase = getCurrentWeatherUseCase;

  Future<void> getWeatherData(String cityName) async {
    try {
      onLoading();
      weather = await _getCurrentWeatherUseCase(cityName: cityName);
      onCompleted();
    } on Exception catch (ex) {
      onException(ex);
    }
  }
}
