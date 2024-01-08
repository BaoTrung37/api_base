// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:api_base/data/services/network_services/client/rest_client.dart';
import 'package:api_base/domain/repositories/movie/movie_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieRepositoryIml extends MovieRepository {
  final RestClient restClient;
  MovieRepositoryIml({
    required this.restClient,
  });

  @override
  Future<MovieResponse?> getMovieDetail({
    required int movieId,
    String? appendToResponse,
  }) async {
    try {
      final response = await restClient.getMovieDetail(
        movieId,
        appendToResponse,
      );

      return response;
    } catch (error) {
      rethrow;
    }
  }
}
