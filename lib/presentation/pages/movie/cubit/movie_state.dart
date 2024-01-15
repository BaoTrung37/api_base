import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_state.freezed.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState({
    @Default(AppStatus.initial) AppStatus status,
    @Default([]) List<MovieResponse> movies,
    AppError? appError,
  }) = _MovieState;
}
