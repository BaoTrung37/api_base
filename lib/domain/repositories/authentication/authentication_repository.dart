import 'package:api_base/data/models/responses/responses.dart';

abstract class AuthenticationRepository {
  Future<GuestSessionResponse> getGuestSession();
}
