part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(LoadingStatus.initial) LoadingStatus loginStatus,
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default('baotrung') String email,
    @Default('') String password,
    @Default(false) bool isRemember,
  }) = _SignInState;
}
