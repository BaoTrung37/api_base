import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import 'package:api_base/data/services/network_services/api_constants.dart';

part 'rest_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio, {@factoryParam String? baseUrl}) = _RestClient;

  @GET('/authentication/guest_session/new')
  Future<GuestSessionResponse> getGuestSession();

  @GET('/authentication/token/new')
  Future<RequestTokenResponse> getRequestToken();

  @POST('/authentication/session/new')
  Future<SessionResponse> postCreateSession(
    @Body() SessionRequest body,
  );

  @POST('/authentication/token/validate_with_login')
  Future<RequestTokenResponse> postCreateSessionWithLogin(
    @Body() SessionWithLoginRequest body,
  );
}
