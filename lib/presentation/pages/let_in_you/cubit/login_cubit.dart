// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@lazySingleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    // this._postCreateRequestTokenUseCase,
    this._postCreateRequestTokenV4UseCase,
    this._postCreateAccessTokenUseCase,
    this._postCreateSessionUseCase,
  ) : super(const LoginState());

  // final PostCreateRequestTokenUseCase _postCreateRequestTokenUseCase;
  final PostCreateRequestTokenV4UseCase _postCreateRequestTokenV4UseCase;
  final PostCreateAccessTokenUseCase _postCreateAccessTokenUseCase;
  final PostCreateSessionUseCase _postCreateSessionUseCase;

  Future<void> loginAsGuest() async {
    //
  }

  Future<void> loginByAccessToken() async {
    //
    try {
      //
      final requestToken = await _getRequestToken();
      if (requestToken == null) {
        return;
      }
      final accessToken = await _getAccessTokenV4(requestToken);
      if (accessToken != null) {
        return;
      }
    } catch (e) {
      //
    }
  }

  Future<String?> _getRequestToken() async {
    try {
      final response = await _postCreateRequestTokenV4UseCase.run();
      if (response.success) {
        final requestToken = response.requestToken;
        return requestToken;
      }
    } on Exception catch (e) {
      emit(
        state.copyWith(
          loginStatus: AppStatus.error,
          appError: e.appError,
        ),
      );
    }
    return null;
  }

  Future<String?> _getAccessTokenV4(
    String requestToken,
  ) async {
    try {
      final response = await _postCreateAccessTokenUseCase
          .run(PostCreateAccessTokenInput(requestToken: requestToken));
      if (response.success) {
        final accessToken = response.accessToken;
        return accessToken;
      }
    } on Exception catch (e) {
      emit(
        state.copyWith(
          loginStatus: AppStatus.error,
          appError: e.appError,
        ),
      );
    }
    return null;
  }
}
