part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.started() = _Started;
  const factory SignInEvent.signInSubmitted() = _SignInSubmitted;
  const factory SignInEvent.signUpSubmitted() = _SignUpSubmitted;
  const factory SignInEvent.rememberMeChanged(bool value) = _RememberMe;
  const factory SignInEvent.emailChanged(String email) = _EmailChanged;
  const factory SignInEvent.passwordChanged(String password) = _PasswordChanged;
}
