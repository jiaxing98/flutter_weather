import 'package:flutter/cupertino.dart';
import 'package:flutter_weather/core/dependencies/utils.dart';
import 'package:flutter_weather/core/utils/authenticate_helper.dart';

class LoginPageVM extends ChangeNotifier {
  bool login() {
    final authHelper = utils.get<AuthenticateHelper>();
    return authHelper.login();
  }
}
