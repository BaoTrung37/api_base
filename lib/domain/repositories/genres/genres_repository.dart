import 'package:api_base/data/models/genres/genres.dart';

abstract class GenresRepository {
  Future<Map<int, Genre>> getMovieGenresList();
  Future<Map<int, Genre>> getTvGenresList();
}
