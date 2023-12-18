import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInEvent>(
      (event, emit) {
        event.map(
          started: (_) => _stared(emit),
          signInSubmitted: (event) => _signInSubmitted(emit),
          signUpSubmitted: (_) => {},
          rememberMeChanged: (event) => _rememberMeChanged(event, emit),
          emailChanged: (event) => _emailChanged(event, emit),
          passwordChanged: (event) => _passwordChanged(event, emit),
        );
      },
    );
  }

  Future<void> _rememberMeChanged(
      _RememberMe event, Emitter<SignInState> emit) async {
    emit(
      state.copyWith(isRemember: event.value),
    );
  }

  Future<void> _signInSubmitted(Emitter<SignInState> emit) async {
    try {
      emit(state.copyWith(loginStatus: LoadingStatus.inProgress));

      debugPrint('1:${state.email} 2:${state.password} 3:${state.isRemember}');

      emit(state.copyWith(loginStatus: LoadingStatus.success));
    } catch (e) {
      emit(state.copyWith(loginStatus: LoadingStatus.error));
    }
  }

  Future<void> _emailChanged(
      _EmailChanged event, Emitter<SignInState> emit) async {
    emit(
      state.copyWith(email: event.email),
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
