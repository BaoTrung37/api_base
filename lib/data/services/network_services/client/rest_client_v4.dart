import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/data/services/network_services/commons/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'rest_client_v4.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrlV4)
abstract class RestClientV4 {
  @factoryMethod
  factory RestClientV4(Dio dio, {@factoryParam String? baseUrl}) =
      _RestClientV4;

  @POST('/auth/request_token')
  Future<RequestTokenResponse> createRequestToken(
    @Body() RequestTokenRequest body,
  );

  @POST('/auth/access_token')
  Future<AccessTokenResponse> createAccessToken(
    @Body() AccessTokenRequest body,
  );
}
