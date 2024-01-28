import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_controller_state.freezed.dart';

@freezed
class MoviesControllerState with _$MoviesControllerState {
  const factory MoviesControllerState({
    @Default(AppStatus.initial) AppStatus status,
    @Default([]) List<MovieResponse> nowPlayingMovies,
    @Default([]) List<MovieResponse> popularMovies,
    @Default([]) List<MovieResponse> trendingMovies,
    @Default([]) List<MovieResponse> upcomingMovies,
    AppError? appError,
  }) = _MoviesControllerState;
}
