// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:api_base/data/services/network_services/client/rest_client.dart';
import 'package:api_base/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieListRepositoryImp extends MovieListsRepository {
  final RestClient restClient;
  MovieListRepositoryImp({
    required this.restClient,
  });

  @override
  Future<List<MovieResponse>> getPopularMovieLists({
    String language = 'en-US',
    int page = 1,
    String? region,
  }) async {
    final response = await restClient.getPopularMovies(
      page,
      region,
    );
    return response.results;
  }

  @override
  Future<List<MovieResponse>> getNowPlayingMovieLists({
    int page = 1,
    String? region,
  }) async {
    final response = await restClient.getNowPlayingMovies(
      page,
      region,
    );
    return response.results;
  }
}
