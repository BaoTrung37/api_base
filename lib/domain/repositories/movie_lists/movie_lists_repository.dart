import 'package:api_base/data/models/models.dart';

abstract class MovieListsRepository {
  Future<List<MovieResponse>> getPopularMovieLists({
    int page = 1,
    String? region,
  });
  Future<List<MovieResponse>> getNowPlayingMovieLists({
    int page = 1,
    String? region,
  });
}
