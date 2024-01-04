import 'package:api_base/data/models/models.dart';

abstract class MovieListsRepository {
  Future<ApiCollectionResponse<MovieResponse>> getPopularMovieLists({
    int page = 1,
    String? region,
  });
  Future<ApiCollectionResponse<MovieResponse>> getNowPlayingMovieLists({
    int page = 1,
    String? region,
  });
}
