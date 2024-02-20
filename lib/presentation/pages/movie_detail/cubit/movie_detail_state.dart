part of 'movie_detail_cubit.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState({
    @Default(AppStatus.initial) AppStatus status,
    MediaResponse? media,
    AppError? appError,
  }) = _MovieDetailState;
}
