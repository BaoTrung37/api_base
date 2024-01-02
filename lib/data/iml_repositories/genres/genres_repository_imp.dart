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
  Future<GenresResponse> getMovieGenresList() async {
    final response = await restClient.getMovieGenres();
    return response;
  }

  @override
  Future<GenresResponse> getTvGenresList() async {
    final response = await restClient.getTvGenres();
    return response;
  }
}
