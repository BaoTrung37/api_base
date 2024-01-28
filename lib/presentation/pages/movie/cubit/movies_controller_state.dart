part of 'movies_controller_cubit.dart';

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
