import 'package:dio/dio.dart';
import 'package:flutter_weather/core/mixins/handle_api_exception_mixin.dart';
import 'package:flutter_weather/core/networks/weather_api_config.dart';
import 'package:flutter_weather/features/weather/data/models/weather_model.dart';

abstract class WeatherDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class WeatherDataSourceImpl extends WeatherDataSource
    with HandleApiExceptionMixin {
  final Dio _dio;

  WeatherDataSourceImpl(this._dio);

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    _dio.options = WeatherApiConfig.weatherOptions;
    try {
      var response = await _dio.get(
        '/weather',
        queryParameters: {
          'q': cityName,
          'appid': WeatherApiConfig.apiKey,
          'units': 'metric',
        },
      );
      return WeatherModel.fromJson(response.data);
    } on DioException catch (ex) {
      throw handleApiException(ex);
    }
  }
}
