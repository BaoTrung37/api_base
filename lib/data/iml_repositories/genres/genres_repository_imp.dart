import 'package:api_base/data/data.dart';
import 'package:api_base/data/models/genres/genres_response.dart';
import 'package:api_base/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GenresRepositoryImp extends GenresRepository {
  GenresRepositoryImp({
    required this.restClient,
  });

  final RestClient restClient;

  final movieGenreMap = <int, Genre>{};
  final tvShowsGenreMap = <int, Genre>{};

  @override
  Future<Map<int, Genre>> getMovieGenresList() async {
    if (movieGenreMap.entries.isNotEmpty) {
      return movieGenreMap;
    }
    final response = await restClient.getMovieGenres();
    final genreMap = response.genres.fold(movieGenreMap, (map, genre) {
      map[genre.id] = genre;
      return map;
    });
    return genreMap;
  }

  @override
  Future<Map<int, Genre>> getTvGenresList() async {
    if (tvShowsGenreMap.entries.isNotEmpty) {
      return tvShowsGenreMap;
    }
    final response = await restClient.getTvGenres();
    final genreMap = response.genres.fold(tvShowsGenreMap, (map, genre) {
      map[genre.id] = genre;
      return map;
    });
    return genreMap;
  }
}
