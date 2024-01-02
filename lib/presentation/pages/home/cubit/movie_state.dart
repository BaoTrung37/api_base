part of 'popular_movie_cubit.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState({
    @Default(AppStatus.initial) AppStatus status,
    @Default([]) List<MovieResponse> movies,
  }) = _MovieState;
}
