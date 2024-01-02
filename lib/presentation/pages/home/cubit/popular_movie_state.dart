part of 'popular_movie_cubit.dart';

@freezed
class PopularMovieState with _$PopularMovieState {
  const factory PopularMovieState({
    @Default(AppStatus.initial) AppStatus status,
  }) = _PopularMovieState;
}
