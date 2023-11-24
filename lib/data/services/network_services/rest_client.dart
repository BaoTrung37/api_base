import 'package:api_base/data/services/network_services/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../models/base/api_collection_response.dart';

part 'rest_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio, {@factoryParam String? baseUrl}) = _RestClient;

  // @GET('/authentication')
  // Future<ApiCollectionResponse<String?>> getUtilGenres();

  // @GET('/titles/utils/lists')
  // Future<ApiCollectionResponse<String?>> getUtilLists();
}
