// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/data/services/network_services/client/auth_api_client.dart';
import 'package:api_base/data/services/network_services/client/rest_client.dart';
import 'package:api_base/data/services/preference_services/shared_preference_manager.dart';
import 'package:api_base/domain/repositories/repositories.dart';
import 'package:api_base/domain/use_cases/authentication/post_login_with_username_and_password_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationRepositoryIml extends AuthenticationRepository {
  AuthenticationRepositoryIml({
    required this.restClient,
    required this.authApiClient,
    required this.sharedPreferencesManager,
  });
  final RestClient restClient;
  final AuthApiClient authApiClient;
  final SharedPreferencesManager sharedPreferencesManager;

  @override
  Future<GuestSessionResponse> getGuestSession() {
    return restClient.getGuestSession();
  }

  @override
  Future<RequestTokenResponse> getRequestToken() {
    return authApiClient.getRequestToken();
  }

  @override
  Future<SessionResponse> postCreateSession() async {
    final requestToken = await sharedPreferencesManager.getRequestToken() ?? '';
    return restClient.postCreateSession(
      SessionRequest(requestToken: requestToken),
    );
  }

  @override
  Future<RequestTokenResponse> postCreateSessionWithLogin(
      PostCreateSessionInput input) async {
    return restClient.postCreateSessionWithLogin(
      SessionWithLoginRequest(
        username: input.username,
        password: input.password,
        requestToken: input.requestToken,
      ),
    );
  }
}
