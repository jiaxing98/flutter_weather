abstract class ApiException implements Exception {
  final String message;

  ApiException(this.message);
}

class NoConnectionException extends ApiException {
  NoConnectionException({String? message})
      : super(message ?? "No Internet Connection");
}

class ConnectionTimeoutException extends ApiException {
  ConnectionTimeoutException({String? message})
      : super(message ?? "Connection Timeout");
}

class BadRequestException extends ApiException {
  BadRequestException({String? message}) : super(message ?? "Bad Request");
}

class UnAuthException extends ApiException {
  UnAuthException({String? message}) : super(message ?? "Unauthorised");
}

class ForbiddenException extends ApiException {
  ForbiddenException({String? message}) : super(message ?? "Forbidden");
}

class NotFoundException extends ApiException {
  NotFoundException({String? message}) : super(message ?? "Not Found");
}

class MethodNotAllowedException extends ApiException {
  MethodNotAllowedException({String? message})
      : super(message ?? "Method Not Allowed");
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException({String? message})
      : super(message ?? "Internal Server Error");
}

class UnknownApiException extends ApiException {
  UnknownApiException({String? message})
      : super(message ?? "Something went wrong");
}
