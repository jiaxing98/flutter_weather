import 'package:flutter_weather/core/mixins/handle_api_exception_mixin.dart';
import 'package:flutter_weather/features/weather/data/data_sources/weather_data_source.dart';
import 'package:flutter_weather/features/weather/domain/entities/weather_entity.dart';
import 'package:flutter_weather/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository
    with HandleApiExceptionMixin {
  final WeatherDataSource _dataSource;

  WeatherRepositoryImpl(this._dataSource);

  @override
  Future<WeatherEntity> getCurrentWeather(String cityName) async {
    final model = await _dataSource.getCurrentWeather(cityName);
    return WeatherEntity.fromModel(model);
  }
}
