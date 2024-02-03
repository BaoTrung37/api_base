part of 'tv_detail_cubit.dart';

@freezed
class TvDetailState with _$TvDetailState {
  const factory TvDetailState({
    @Default(AppStatus.initial) AppStatus status,
    TvSeriesResponse? tvSeries,
    AppError? appError,
  }) = _TvDetailState;
}
