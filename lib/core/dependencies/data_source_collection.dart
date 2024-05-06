import 'package:dio/dio.dart';
import 'package:flutter_weather/core/dependencies/base_collection.dart';
import 'package:flutter_weather/features/weather/data/data_sources/weather_data_source.dart';

final DataSourceCollection dataSource = DataSourceCollection._();

class DataSourceCollection extends BaseCollection {
  DataSourceCollection._();

  @override
  T get<T extends Object>() => collection.get<T>();

  @override
  void setup() {
    collection.registerSingleton<Dio>(Dio());

    collection.registerFactory<WeatherDataSource>(
      () => WeatherDataSourceImpl(collection.get<Dio>()),
    );
  }
}
