import 'package:api_base/data/models/models.dart';

abstract class MovieListsRepository {
  Future<ApiCollectionResponse<PopularResponse>> getPopularMovieLists({
    String language = 'en-US',
    int page = 1,
    String? region,
  });
}
