import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/domain/use_cases/authentication/post_create_session_with_login_use_case.dart';

abstract class AuthenticationRepository {
  Future<GuestSessionResponse> getGuestSession();
  Future<RequestTokenResponse> getRequestToken();
  Future<SessionResponse> postCreateSession();
  Future<RequestTokenResponse> postCreateSessionWithLogin(
      PostCreateSessionInput input);
}
