import 'package:api_base/data/models/models.dart';

abstract class MovieRepository {
  Future<MovieResponse> getMovieDetail({
    required String movieId,
    String? appendToResponse,
  });
}
