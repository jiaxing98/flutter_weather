import 'package:flutter_weather/core/dependencies/data_sources.dart';
import 'package:flutter_weather/features/weather/data/data_sources/weather_data_source.dart';
import 'package:flutter_weather/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_weather/features/weather/domain/repositories/weather_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt repositories = GetIt.asNewInstance();

void injectRepositories() {
  repositories.registerFactory<WeatherRepository>(
    () => WeatherRepositoryImpl(
      dataSources.get<WeatherDataSource>(),
    ),
  );
}
