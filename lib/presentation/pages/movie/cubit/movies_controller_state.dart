part of 'movies_controller_cubit.dart';

@freezed
class MoviesControllerState with _$MoviesControllerState {
  const factory MoviesControllerState({
    @Default(AppStatus.initial) AppStatus status,
    @Default([]) List<MediaResponse> nowPlayingMovies,
    @Default([]) List<MediaResponse> popularMovies,
    @Default([]) List<MediaResponse> trendingMovies,
    @Default([]) List<MediaResponse> upcomingMovies,
    AppError? appError,
  }) = _MoviesControllerState;
}
