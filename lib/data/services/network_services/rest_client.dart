import 'package:api_base/data/services/network_services/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/titles')
  Future getTitles();

  @GET('/titles/utils/genres')
  Future getUtilGenres();
}
