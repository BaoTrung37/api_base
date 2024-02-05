part of 'media_detail_cubit.dart';

@freezed
class MediaDetailState with _$MediaDetailState {
  const factory MediaDetailState({
    @Default(AppStatus.initial) AppStatus status,
    MediaResponse? movie,
    AppError? appError,
  }) = _MediaDetailState;
}
