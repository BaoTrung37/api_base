// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._postCreateRequestTokenV4UseCase,
    this._postCreateAccessTokenUseCase,
    this._postCreateSessionUseCase,
  ) : super(const LoginState());

  final PostCreateRequestTokenV4UseCase _postCreateRequestTokenV4UseCase;
  final PostCreateAccessTokenUseCase _postCreateAccessTokenUseCase;
  final PostCreateSessionUseCase _postCreateSessionUseCase;

  Future<void> loginAsGuest() async {
    //
  }

  Future<void> loginByAccessToken() async {
    try {
      emit(state.copyWith(
        loginStatus: AppStatus.inProgress,
      ));
      final requestToken = await _getRequestToken();
      await launchUrl(
        Uri.parse(
            'https://www.themoviedb.org/auth/access?request_token=$requestToken'),
        mode: LaunchMode.inAppBrowserView,
      );
      if (requestToken == null) {
        return;
      }
      final accessToken = await _getAccessTokenV4(requestToken);
      if (accessToken == null) {
        return;
      }
      await _saveSessionId(accessToken);

      emit(state.copyWith(
        loginStatus: AppStatus.success,
      ));
    } catch (e) {
      //
      emit(state.copyWith(
        loginStatus: AppStatus.error,
      ));
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

  Future<void> _saveSessionId(String accessToken) async {
    try {
      await _postCreateSessionUseCase
          .run(PostCreateSessionInput(accessToken: accessToken));
    } on Exception catch (e) {
      emit(
        state.copyWith(
          loginStatus: AppStatus.error,
          appError: e.appError,
        ),
      );
    }
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
