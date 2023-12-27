import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/data/services/network_services/commons/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../models/authentication/request_token_request.dart';

part 'auth_api_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrlV4)
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio, {@factoryParam String? baseUrl}) =
      _AuthApiClient;

  @POST('/auth/request_token')
  Future<RequestTokenResponse> createRequestToken(
    @Body() RequestTokenRequest body,
  );

  @POST('/auth/access_token')
  Future<AccessTokenResponse> createAccessToken(
    @Body() AccessTokenRequest body,
  );
}
