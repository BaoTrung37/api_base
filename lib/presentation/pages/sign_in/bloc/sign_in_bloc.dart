import 'dart:async';

import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

@lazySingleton
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this._postLoginWithUsernameAndPasswordUseCase)
      : super(const SignInState()) {
    on<SignInEvent>(
      (event, emit) async {
        await event.map<FutureOr<void>>(
          started: (_) => _stared(emit),
          signInSubmitted: (event) => _signInSubmitted(emit),
          signUpSubmitted: (_) => {},
          rememberMeChanged: (event) => _rememberMeChanged(event, emit),
          usernameChanged: (event) => _usernameChanged(event, emit),
          passwordChanged: (event) => _passwordChanged(event, emit),
          loginSuccess: (_LoginSuccess value) => {},
          loginFailure: (_LoginFailure value) => {},
        );
      },
    );
  }
  final PostLoginWithUsernameAndPasswordUseCase
      _postLoginWithUsernameAndPasswordUseCase;

  Future<void> _rememberMeChanged(
      _RememberMe event, Emitter<SignInState> emit) async {
    emit(
      state.copyWith(isRemember: event.value),
    );
  }

  Future<void> _signInSubmitted(Emitter<SignInState> emit) async {
    try {
      emit(state.copyWith(loginStatus: LoadingStatus.inProgress));

      await _postLoginWithUsernameAndPasswordUseCase.run(
        PostCreateSessionInput(
            username: state.username, password: state.password),
      );
      add(const SignInEvent.loginSuccess());
      emit(state.copyWith(loginStatus: LoadingStatus.success));
    } catch (e) {
      add(const SignInEvent.loginFailure());
      emit(state.copyWith(loginStatus: LoadingStatus.error));
    }
  }

  Future<void> _usernameChanged(
      _UsernameChanged event, Emitter<SignInState> emit) async {
    emit(
      state.copyWith(username: event.username),
    );
  }

  Future<void> _passwordChanged(
      _PasswordChanged event, Emitter<SignInState> emit) async {
    emit(
      state.copyWith(password: event.password),
    );
  }

  Future<void> _stared(Emitter<SignInState> emit) async {
    emit(state.copyWith(status: LoadingStatus.inProgress));
    // Check remember account

    //
    emit(state.copyWith(status: LoadingStatus.success));
  }
}
