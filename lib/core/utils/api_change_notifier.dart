import 'package:flutter/material.dart';
import 'package:flutter_weather/core/utils/api_exception.dart';
import 'package:fpdart/fpdart.dart';

class ApiChangeNotifier extends ChangeNotifier {
  ApiState _state = ApiState.init;
  ApiException? _exception;

  ApiState get state => _state;
  ApiException? get exception => _exception;

  Future<Either<ApiException, T>> apiCalled<T>(Future<T> usecase) async {
    try {
      _onLoading();
      final result = await usecase;
      _onCompleted();

      return Right(result);
    } on ApiException catch (ex) {
      _onException(ex);
      return Left(ex);
    }
  }

  void _onLoading() {
    _state = ApiState.loading;
    notifyListeners();
  }

  void _onCompleted() {
    _state = ApiState.completed;
    notifyListeners();
  }

  void _onException(ApiException? exception) {
    _state = ApiState.exception;
    _exception = exception;
    notifyListeners();
  }
}

enum ApiState { init, loading, completed, exception }
