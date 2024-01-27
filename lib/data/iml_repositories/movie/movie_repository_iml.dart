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
  Future<MovieResponse> getMovieDetail({
    required int movieId,
    String? appendToResponse,
  }) async {
    final response = await restClient.getMovieDetail(
      movieId,
      appendToResponse,
    );

    return response;
  }

  @override
  Future<List<MovieResponse>> getSimilarMovieList({
    required int movieId,
    required int page,
  }) async {
    final response = await restClient.getSimilarMovies(
      movieId,
      page,
    );
    return response.results;
  }

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

  @override
  Future<List<MovieResponse>> getUpcomingMovieLists({
    int page = 1,
    String? region,
  }) async {
    final response = await restClient.getUpcomingMovies(
      page,
      region,
    );
    return response.results;
  }
}
