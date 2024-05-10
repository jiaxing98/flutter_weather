import 'package:flutter_weather/core/dependencies/usecases.dart';
import 'package:flutter_weather/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:flutter_weather/features/weather/presentation/pages/weather_page_viewmodel.dart';
import 'package:get_it/get_it.dart';

final GetIt viewModels = GetIt.asNewInstance();

void injectViewModels() {
  viewModels.registerFactory<WeatherPageVM>(
    () => WeatherPageVM(
      getCurrentWeatherUseCase: usecases.get<GetCurrentWeatherUseCase>(),
    ),
  );
}
