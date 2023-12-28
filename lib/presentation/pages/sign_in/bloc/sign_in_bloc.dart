import 'dart:async';

import 'package:api_base/data/services/services.dart';
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
  SignInBloc(
    this._postLoginWithUsernameAndPasswordUseCase,
    this._getRequestTokenUseCase,
    this._sharedPreferencesManager,
    this._postCreateSessionUseCase,
  ) : super(const SignInState()) {
    on<SignInEvent>(
      (event, emit) async {
        await event.map<FutureOr<void>>(
          started: (_) => _stared(emit),
          signInSubmitted: (event) => _signInSubmitted(emit),
          signUpSubmitted: (_) => {},
          rememberMeChanged: (event) => _rememberMeChanged(event, emit),
          usernameChanged: (event) => _usernameChanged(event, emit),
          passwordChanged: (event) => _passwordChanged(event, emit),
          loginSuccess: (event) => _loginSuccess(emit),
          loginFailure: (event) => _loginFailure(emit),
        );
      },
    );
  }

  final PostLoginWithUsernameAndPasswordUseCase
      _postLoginWithUsernameAndPasswordUseCase;

  final GetRequestTokenUseCase _getRequestTokenUseCase;
  final PostCreateSessionUseCase _postCreateSessionUseCase;
  final SharedPreferencesManager _sharedPreferencesManager;

  Future<void> _loginSuccess(Emitter<SignInState> emit) async {
    emit(state.copyWith(loginStatus: AppStatus.success));
  }

  Future<void> _loginFailure(Emitter<SignInState> emit) async {
    emit(state.copyWith(loginStatus: AppStatus.error));
  }

  Future<void> _rememberMeChanged(
      _RememberMe event, Emitter<SignInState> emit) async {
    emit(
      state.copyWith(isRemember: event.value),
    );
  }

  Future<void> _signInSubmitted(Emitter<SignInState> emit) async {
    try {
      emit(state.copyWith(loginStatus: AppStatus.inProgress));

      final requestTokenResponse = await _getRequestTokenUseCase.run();

      if (!requestTokenResponse.success) {
        add(const SignInEvent.loginFailure());
        emit(state.copyWith(loginStatus: AppStatus.error));
        return;
      }

      final requestTokenResponse1 =
          await _postLoginWithUsernameAndPasswordUseCase.run(
        PostLoginWithUsernameAndPasswordInput(
          username: state.username,
          password: state.password,
          requestToken: requestTokenResponse.requestToken,
        ),
      );

      if (!requestTokenResponse1.success) {
        add(const SignInEvent.loginFailure());
        return;
      }
      final sessionResponse =
          await _postCreateSessionUseCase.run(PostCreateSessionInput(
        requestToken: requestTokenResponse1.requestToken,
      ));
      if (sessionResponse.success) {
        await _sharedPreferencesManager.saveSession(
          sessionId: sessionResponse.sessionId,
        );
      }

      add(const SignInEvent.loginSuccess());
    } catch (e) {
      add(const SignInEvent.loginFailure());
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
    emit(state.copyWith(status: AppStatus.inProgress));
    // Check remember account

    //
    emit(state.copyWith(status: AppStatus.success));
  }
}
