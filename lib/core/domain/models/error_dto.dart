import 'package:dakwrite/core/domain/models/error_type.dart';

class ErrorDto {
  final String message;
  final String errorCode;
  final ErrorType errorType;
  final Exception? exception;

  ErrorDto({
    required this.message,
    this.errorCode = '-',
    this.errorType = ErrorType.unknown,
    this.exception,
  });

  bool isUnauthorized() {
    return errorType == ErrorType.unauthorized;
  }

  @override
  String toString() {
    return 'ErrorDto{message: $message, errorCode: $errorCode, errorType: $errorType, exception: $exception}';
  }
}
