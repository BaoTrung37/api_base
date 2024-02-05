import 'package:api_base/data/models/models.dart';

abstract class MovieRepository {
  Future<MediaResponse> getMovieDetail({
    required int movieId,
    String? appendToResponse,
  });

  Future<List<MediaResponse>> getSimilarMovieList({
    required int movieId,
    required int page,
  });

  Future<List<MediaResponse>> getPopularMovieList({
    required int page,
    String? region,
  });

  Future<List<MediaResponse>> getNowPlayingMovieList({
    required int page,
    String? region,
  });

  Future<List<MediaResponse>> getUpcomingMovieList({
    required int page,
    String? region,
  });
}
