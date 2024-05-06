import 'package:dio/dio.dart';
import 'package:flutter_weather/core/utils/api_exception.dart';

mixin HandleApiExceptionMixin {
  ApiException handleApiException(DioException ex) {
    switch (ex.type) {
      case DioExceptionType.badResponse:
        return _validateBadResponse(ex.response);
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
        return ConnectionTimeoutException(message: ex.message);
      default:
        return UnknownApiException();
    }
  }

  ApiException _validateBadResponse(Response? response) {
    if (response == null) {
      return UnknownApiException();
    }

    switch (response.statusCode) {
      case 400:
        return BadRequestException();
      case 401:
        return UnAuthException();
      case 403:
        return ForbiddenException();
      case 404:
        return NotFoundException();
      case 405:
        return MethodNotAllowedException();
      case 500:
        return InternalServerErrorException();
      default:
        return UnknownApiException();
    }
  }
}
