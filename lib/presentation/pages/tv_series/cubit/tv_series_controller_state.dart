part of 'tv_series_controller_cubit.dart';

@freezed
class TvSeriesControllerState with _$TvSeriesControllerState {
  const factory TvSeriesControllerState({
    @Default(AppStatus.initial) AppStatus status,
    @Default([]) List<TvSeriesResponse> airingTodayList,
    @Default([]) List<TvSeriesResponse> onTheAirList,
    @Default([]) List<TvSeriesResponse> popularList,
    @Default([]) List<TvSeriesResponse> topRatedList,
    AppError? appError,
  }) = _TvSeriesControllerState;
}
