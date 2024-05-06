import 'package:flutter_weather/core/dependencies/base_collection.dart';
import 'package:flutter_weather/core/dependencies/usecase_collection.dart';
import 'package:flutter_weather/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:flutter_weather/features/weather/presentation/pages/weather_page_viewmodel.dart';

final ViewModelCollection viewModel = ViewModelCollection._();

class ViewModelCollection extends BaseCollection {
  ViewModelCollection._();

  @override
  T get<T extends Object>() => collection.get<T>();

  @override
  void setup() {
    collection.registerFactory<WeatherPageVM>(
      () => WeatherPageVM(
        getCurrentWeatherUseCase: usecase.get<GetCurrentWeatherUseCase>(),
      ),
    );
  }
}
