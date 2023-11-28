// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/responses/authentication/guest_session_response.dart';
import 'package:api_base/data/services/network_services/rest_client.dart';
import 'package:api_base/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationRepositoryIml extends AuthenticationRepository {
  final RestClient restClient;
  AuthenticationRepositoryIml({
    required this.restClient,
  });

  @override
  Future<GuestSessionResponse> getGuestSession() {
    return restClient.getGuestSession();
  }
}
