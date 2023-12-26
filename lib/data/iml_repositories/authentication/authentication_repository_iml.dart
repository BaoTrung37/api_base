import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/data/services/network_services/rest_client.dart';
import 'package:api_base/data/services/preference_services/shared_preference_manager.dart';
import 'package:api_base/domain/repositories/repositories.dart';
import 'package:api_base/domain/use_cases/authentication/post_login_with_username_and_password_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationRepositoryIml extends AuthenticationRepository {
  AuthenticationRepositoryIml({
    required this.restClient,
    required this.sharedPreferencesManager,
  });
  final RestClient restClient;
  final SharedPreferencesManager sharedPreferencesManager;

  @override
  Future<GuestSessionResponse> getGuestSession() {
    return restClient.getGuestSession();
  }

  @override
  Future<RequestTokenResponse> getRequestToken() {
    return restClient.getRequestToken();
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
        requestToken: input.requestToken
      ),
    );
  }
}
