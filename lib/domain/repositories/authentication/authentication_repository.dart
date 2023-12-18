import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/domain/use_cases/authentication/post_login_with_username_and_password_use_case.dart';

abstract class AuthenticationRepository {
  Future<GuestSessionResponse> getGuestSession();
  Future<RequestTokenResponse> getRequestToken();
  Future<SessionResponse> postCreateSession();
  Future<RequestTokenResponse> postCreateSessionWithLogin(
      PostCreateSessionInput input);
}
