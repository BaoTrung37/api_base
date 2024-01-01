part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(AppStatus.initial) AppStatus loginStatus,
    AppError? appError,
  }) = _LoginState;
}
