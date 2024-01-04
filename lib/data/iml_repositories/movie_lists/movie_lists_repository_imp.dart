// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/base/api_collection_response.dart';
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
  Future<ApiCollectionResponse<MovieResponse>> getPopularMovieLists({
    String? language = 'en-US',
    int? page = 1,
    String? region,
  }) {
    final response = restClient.getPopularMovies(
      language: language,
      page: page,
      region: region,
    );
    return response;
  }

  @override
  Future<ApiCollectionResponse<MovieResponse>> getNowPlayingMovieLists({
    String? language = 'en-US',
    int? page = 1,
    String? region,
  }) {
    final response = restClient.getNowPlayingMovies(
      language: language,
      page: page,
      region: region,
    );
    return response;
  }
}
