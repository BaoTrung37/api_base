part of 'tv_series_controller_cubit.dart';

@freezed
class TvSeriesControllerState with _$TvSeriesControllerState {
  const factory TvSeriesControllerState({
    @Default(AppStatus.initial) AppStatus status,
    @Default([]) List<MediaResponse> airingTodayList,
    @Default([]) List<MediaResponse> onTheAirList,
    @Default([]) List<MediaResponse> popularList,
    @Default([]) List<MediaResponse> topRatedList,
    AppError? appError,
  }) = _TvSeriesControllerState;
}
