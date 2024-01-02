import 'package:api_base/data/data.dart';
import 'package:api_base/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class GenresRepositoryImp extends GenresRepository {
  GenresRepositoryImp({
    required this.restClient,
  });

  final RestClient restClient;

  @override
  Future<GenresResponse> getMovieGenresList({
    String? language,
  }) async {
    final response = await restClient.getMovieGenres(
      language: language,
    );
    return response;
  }

  @override
  Future<GenresResponse> getTvGenresList({
    String? language,
  }) async {
    final response = await restClient.getTvGenres(
      language: language,
    );
    return response;
  }
}
