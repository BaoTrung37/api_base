part of 'show_all_cubit.dart';

@freezed
class ShowAllState with _$ShowAllState {
  const factory ShowAllState({
    @Default(AppStatus.initial) AppStatus status,
    @Default([]) List<MovieResponse> similarMovieList,
    AppError? appError,
  }) = _ShowAllState;
}