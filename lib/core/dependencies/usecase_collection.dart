import 'package:flutter_weather/core/dependencies/base_collection.dart';
import 'package:flutter_weather/core/dependencies/repository_collection.dart';
import 'package:flutter_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_weather/features/weather/domain/usecases/get_current_weather_usecase.dart';

final UseCaseCollection usecase = UseCaseCollection._();

class UseCaseCollection extends BaseCollection {
  UseCaseCollection._();

  @override
  T get<T extends Object>() => collection.get<T>();

  @override
  void setup() {
    collection.registerFactory<GetCurrentWeatherUseCase>(
      () => GetCurrentWeatherUseCase(
        repository.get<WeatherRepository>(),
      ),
    );
  }
}
