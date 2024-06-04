import 'package:dio/dio.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_weather/core/utils/authenticate_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt utils = GetIt.asNewInstance();

void injectUtils() {
  utils.registerSingleton<Dio>(Dio());

  utils.registerSingleton<FlutterLocalization>(FlutterLocalization.instance);

  utils.registerSingletonAsync(
    () => SharedPreferences.getInstance(),
  );

  utils.registerSingleton<AuthenticateHelper>(AuthenticateHelper());
}
