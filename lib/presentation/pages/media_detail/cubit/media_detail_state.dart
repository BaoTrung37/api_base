part of 'media_detail_cubit.dart';

@freezed
class MediaDetailState with _$MediaDetailState {
  const factory MediaDetailState({
    @Default(AppStatus.initial) AppStatus status,
    MediaResponse? media,
    AppError? appError,
  }) = _MediaDetailState;
}
