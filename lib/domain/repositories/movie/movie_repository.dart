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

  Future<List<MovieResponse>> getPopularMovieList({
    required int page,
    String? region,
  });

  Future<List<MovieResponse>> getNowPlayingMovieList({
    required int page,
    String? region,
  });

  Future<List<MovieResponse>> getUpcomingMovieList({
    required int page,
    String? region,
  });
}
