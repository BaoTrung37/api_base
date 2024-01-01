enum ApiErrorType {
  send,
  receive,
}

class AppError {
  const AppError({
    this.errorMessage = '',
    this.type,
  });
  final String? errorMessage;
  final ApiErrorType? type;
}
