import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/domain/use_cases/authentication/authentication.dart';

abstract class AuthenticationRepository {
  Future<GuestSessionResponse> getGuestSession();
  Future<RequestTokenResponse> getRequestToken();
  Future<RequestTokenResponse> createRequestTokenV4();
  Future<AccessTokenResponse> createAccessToken(
      PostCreateAccessTokenInput input);
  Future<SessionResponse> postCreateSession(PostCreateSessionInput input);
  Future<RequestTokenResponse> postCreateSessionWithLogin(
      PostLoginWithUsernameAndPasswordInput input);
}
