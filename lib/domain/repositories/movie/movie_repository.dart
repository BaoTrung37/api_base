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
}
