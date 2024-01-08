part of 'movie_detail_cubit.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState({
    @Default(AppStatus.initial) AppStatus status,
    MovieResponse? movieResponse,
    AppError? appError,
  }) = _MovieDetailState;
}
