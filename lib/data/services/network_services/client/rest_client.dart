import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/data/models/models.dart';
import 'package:api_base/data/services/network_services/commons/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrlV3)
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio, {@factoryParam String? baseUrl}) = _RestClient;

  @GET('/authentication/guest_session/new')
  Future<GuestSessionResponse> getGuestSession();

  @GET('/authentication/token/new')
  Future<RequestTokenResponse> getRequestToken();

  @POST('/authentication/session/new')
  Future<SessionResponse> postCreateSession(
    @Body() SessionRequest body,
  );

  @POST('/authentication/token/validate_with_login')
  Future<RequestTokenResponse> postCreateSessionWithLogin(
    @Body() SessionWithLoginRequest body,
  );

  // Start Movie Lists
  @GET('/movie/popular')
  Future<ApiCollectionResponse<MovieResponse>> getPopularMovies(
    @Query('page') int? page,
    @Query('region') String? region,
  );

  @GET('/movie/now_playing')
  Future<ApiCollectionResponse<MovieResponse>> getNowPlayingMovies(
    @Query('page') int? page,
    @Query('region') String? region,
  );

  @GET('/movie/upcoming')
  Future<ApiCollectionResponse<MovieResponse>> getUpcomingMovies(
    @Query('page') int? page,
    @Query('region') String? region,
  );
  // End Movie Lists

  // Start movie

  @GET('/movie/{movie_id}')
  Future<MovieResponse> getMovieDetail(
    @Path('movie_id') int movieId,
    @Query('append_to_response') String? appendToResponse,
  );

  @GET('/movie/{movie_id}/similar')
  Future<ApiCollectionResponse<MovieResponse>> getSimilarMovies(
    @Path('movie_id') int movieId,
    @Query('page') int page,
  );

  // End movie

  /// Start Genres
  @GET('/genre/movie/list')
  Future<GenresResponse> getMovieGenres();

  @GET('/genre/tv/list')
  Future<GenresResponse> getTvGenres();

  /// End Genres

  /// Start Trending

  @GET('/trending/all/{time_window}')
  Future<ApiCollectionResponse<MovieResponse>> getTrendingAll(
    @Path('time_window') String timeWindow,
    @Query('page') int page,
  );

  @GET('/trending/movie/{time_window}')
  Future<ApiCollectionResponse<MovieResponse>> getTrendingMovies(
    @Path('time_window') String timeWindow,
    @Query('page') int page,
  );

  /// End Trending

  /// Start Tv Series

  @GET('/tv/airing_today')
  Future<ApiCollectionResponse<MediaResponse>> getAiringTodayTvSeries(
    @Query('page') int page,
    @Query('timezone') String? timezone,
  );

  @GET('/tv/on_the_air')
  Future<ApiCollectionResponse<MediaResponse>> getOnTheAirTvSeries(
    @Query('page') int page,
    @Query('timezone') String? timezone,
  );

  @GET('/tv/popular')
  Future<ApiCollectionResponse<MediaResponse>> getPopularTvSeries(
    @Query('page') int page,
  );

  @GET('/tv/top_rated')
  Future<ApiCollectionResponse<MediaResponse>> getTopRatedTvSeries(
    @Query('page') int page,
  );

  /// End Tv Series
}
