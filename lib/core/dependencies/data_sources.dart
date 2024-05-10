import 'package:dio/dio.dart';
import 'package:flutter_weather/core/dependencies/utils.dart';
import 'package:flutter_weather/features/weather/data/data_sources/weather_data_source.dart';
import 'package:get_it/get_it.dart';

final GetIt dataSources = GetIt.asNewInstance();

void injectDataSources() {
  dataSources.registerFactory<WeatherDataSource>(
    () => WeatherDataSourceImpl(utils.get<Dio>()),
  );
}
