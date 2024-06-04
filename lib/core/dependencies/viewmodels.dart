import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_weather/core/dependencies/usecases.dart';
import 'package:flutter_weather/core/dependencies/utils.dart';
import 'package:flutter_weather/features/authenticate/presentation/login/login_page_viewmodel.dart';
import 'package:flutter_weather/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:flutter_weather/features/weather/presentation/dashboard/dashboard_scaffold_viewmodel.dart';
import 'package:flutter_weather/features/weather/presentation/first/first_page_viewmodel.dart';
import 'package:flutter_weather/features/weather/presentation/weather_info/weather_page_viewmodel.dart';
import 'package:get_it/get_it.dart';

final GetIt viewModels = GetIt.asNewInstance();

void injectViewModels() {
  viewModels.registerFactory<LoginPageVM>(
    () => LoginPageVM(),
  );

  viewModels.registerFactory<DashboardScaffoldVM>(
    () => DashboardScaffoldVM(
      localization: utils.get<FlutterLocalization>(),
    ),
  );

  viewModels.registerFactory<WeatherPageVM>(
    () => WeatherPageVM(
      getCurrentWeatherUseCase: usecases.get<GetCurrentWeatherUseCase>(),
    ),
  );

  viewModels.registerFactory<FirstPageVM>(
    () => FirstPageVM(),
  );
}
