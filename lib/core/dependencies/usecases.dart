import 'package:flutter_weather/core/dependencies/repositories.dart';
import 'package:flutter_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_weather/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt usecases = GetIt.asNewInstance();

void injectUseCases() {
  usecases.registerFactory<GetCurrentWeatherUseCase>(
    () => GetCurrentWeatherUseCase(
      repositories.get<WeatherRepository>(),
    ),
  );
}
