import 'package:api_base/data/models/models.dart';

abstract class MovieRepository {
  Future<MovieResponse> getMovieDetail({
    required int movieId,
    String? appendToResponse,
  });

  Future<List<MovieResponse>> getSimilarMovieList({
    required int movieId,
    required int page,
  });

  Future<List<MovieResponse>> getPopularMovieLists({
    required int page,
    String? region,
  });

  Future<List<MovieResponse>> getNowPlayingMovieLists({
    required int page,
    String? region,
  });
}
