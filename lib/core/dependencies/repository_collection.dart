import 'package:flutter_weather/core/dependencies/base_collection.dart';
import 'package:flutter_weather/core/dependencies/data_source_collection.dart';
import 'package:flutter_weather/features/weather/data/data_sources/weather_data_source.dart';
import 'package:flutter_weather/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_weather/features/weather/domain/repositories/weather_repository.dart';

final RepositoryCollection repository = RepositoryCollection._();

class RepositoryCollection extends BaseCollection {
  RepositoryCollection._();

  @override
  T get<T extends Object>() => collection.get<T>();

  @override
  void setup() {
    collection.registerFactory<WeatherRepository>(
      () => WeatherRepositoryImpl(
        dataSource.get<WeatherDataSource>(),
      ),
    );
  }
}
