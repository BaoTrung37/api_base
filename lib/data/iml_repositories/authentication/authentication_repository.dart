import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/data/services/network_services/rest_client.dart';
import 'package:api_base/data/services/preference_services/shared_preference_manager.dart';
import 'package:api_base/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationRepositoryIml extends AuthenticationRepository {
  final RestClient restClient;
  final SharedPreferencesManager sharedPreferencesManager;
  AuthenticationRepositoryIml({
    required this.restClient,
    required this.sharedPreferencesManager,
  });

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
    print('requestToken: $requestToken');
    return restClient
        .postCreateSession(SessionRequest(requestToken: requestToken));
  }
}
