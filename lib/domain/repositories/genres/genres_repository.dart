import 'package:api_base/data/models/genres/genres.dart';

abstract class GenresRepository {
  Future<GenresResponse> getMovieGenresList({
    String? language,
  });
  Future<GenresResponse> getTvGenresList({
    String? language,
  });
}
