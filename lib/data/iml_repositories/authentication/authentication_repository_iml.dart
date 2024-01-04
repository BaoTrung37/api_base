// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/data/services/network_services/client/rest_client.dart';
import 'package:api_base/data/services/network_services/client/rest_client_v4.dart';
import 'package:api_base/data/services/preference_services/shared_preference_manager.dart';
import 'package:api_base/domain/repositories/repositories.dart';
import 'package:api_base/domain/use_cases/authentication/authentication.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationRepositoryIml extends AuthenticationRepository {
  AuthenticationRepositoryIml({
    required this.restClient,
    required this.authApiClient,
    required this.sharedPreferencesManager,
  });
  final RestClient restClient;
  final RestClientV4 authApiClient;
  final SharedPreferencesManager sharedPreferencesManager;

  @override
  Future<GuestSessionResponse> getGuestSession() async {
    final response = await restClient.getGuestSession();
    if (response.success) {
      await sharedPreferencesManager.saveGuestSessionId(
          sessionId: response.guestSessionId);
    }
    return response;
  }

  @override
  Future<RequestTokenResponse> getRequestToken() {
    return restClient.getRequestToken();
  }

  @override
  Future<SessionResponse> postCreateSession(
      PostCreateSessionInput input) async {
    final response = await restClient.postCreateSession(
      SessionRequest(
        requestToken: input.requestToken,
      ),
    );

    if (response.success) {
      await sharedPreferencesManager.saveSessionId(
        sessionId: response.sessionId,
      );
    }

    return response;
  }

  @override
  Future<RequestTokenResponse> postCreateSessionWithLogin(
      PostLoginWithUsernameAndPasswordInput input) async {
    return restClient.postCreateSessionWithLogin(
      SessionWithLoginRequest(
        username: input.username,
        password: input.password,
        requestToken: input.requestToken,
      ),
    );
  }

  @override
  Future<AccessTokenResponse> createAccessToken(
      PostCreateAccessTokenInput input) async {
    final response = await authApiClient.createAccessToken(
      AccessTokenRequest(
        requestToken: input.requestToken,
      ),
    );

    if (response.success) {
      await Future.wait([
        sharedPreferencesManager.saveAccessToken(
            accessToken: response.accessToken),
        sharedPreferencesManager.saveAccountId(accountId: response.accountId),
      ]);
    }

    return response;
  }

  @override
  Future<RequestTokenResponse> createRequestTokenV4() {
    return authApiClient.createRequestToken(
      RequestTokenRequest(
        redirectTo: 'app://myapp.com/',
      ),
    );
  }
}
