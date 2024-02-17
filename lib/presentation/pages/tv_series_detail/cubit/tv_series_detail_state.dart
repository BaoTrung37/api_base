part of 'tv_series_detail_cubit.dart';

@freezed
class TvSeriesDetailState with _$TvSeriesDetailState {
  const factory TvSeriesDetailState({
    @Default(AppStatus.initial) AppStatus status,
    MediaResponse? media,
    AppError? appError,
  }) = _TvSeriesDetailState;
}
