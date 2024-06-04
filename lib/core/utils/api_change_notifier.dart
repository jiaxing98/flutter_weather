import 'package:flutter/material.dart';

class ApiChangeNotifier extends ChangeNotifier {
  ApiState _state = ApiState.init;
  Exception? _exception;

  ApiState get state => _state;
  Exception? get exception => _exception;

  void onLoading() {
    _state = ApiState.loading;
    notifyListeners();
  }

  void onCompleted() {
    _state = ApiState.completed;
    notifyListeners();
  }

  void onException(Exception exception) {
    _state = ApiState.exception;
    _exception = exception;
    notifyListeners();
  }
}

enum ApiState { init, loading, completed, exception }
