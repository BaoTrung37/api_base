import 'package:api_base/data/models/base/api_response.dart';
import 'package:api_base/data/models/responses/utils/util_genres_response.dart';
import 'package:api_base/data/services/network_services/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio, {@factoryParam String? baseUrl}) = _RestClient;

  @GET('/titles')
  Future getTitles();

  @GET('/titles/utils/genres')
  Future<ApiResponse<UtilGenresResponse>> getUtilGenres();
}
