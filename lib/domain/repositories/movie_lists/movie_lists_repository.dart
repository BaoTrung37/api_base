import 'package:api_base/data/models/models.dart';

abstract class MovieListsRepository {
  Future<ApiCollectionResponse<MovieResponse>> getPopularMovieLists({
    String language = 'en-US',
    int page = 1,
    String? region,
  });
  Future<ApiCollectionResponse<MovieResponse>> getNowPlayingMovieLists({
    String language = 'en-US',
    int page = 1,
    String? region,
  });
}
