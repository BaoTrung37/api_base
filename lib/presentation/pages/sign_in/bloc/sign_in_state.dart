part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(AppStatus.initial) AppStatus loginStatus,
    @Default(AppStatus.initial) AppStatus status,
    @Default('baotrung') String username,
    @Default('') String password,
    @Default(false) bool isRemember,
  }) = _SignInState;
}
