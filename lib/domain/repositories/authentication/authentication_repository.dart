import 'package:api_base/data/models/authentication/authentication.dart';

abstract class AuthenticationRepository {
  Future<GuestSessionResponse> getGuestSession();
  Future<RequestTokenResponse> getRequestToken();
}
