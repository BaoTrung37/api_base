// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/media/media.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'media_detail_cubit.freezed.dart';
part 'media_detail_state.dart';

@injectable
class MediaDetailCubit extends Cubit<MediaDetailState> {
  MediaDetailCubit(
    this._getMovieDetailUseCase,
    this._getTvSeriesDetailUseCase,
  ) : super(const MediaDetailState());

  final GetMovieDetailUseCase _getMovieDetailUseCase;
  final GetTvSeriesDetailUseCase _getTvSeriesDetailUseCase;

  Future<void> fetchData(MediaDetailArgument argument) async {
    try {
      emit(state.copyWith(status: AppStatus.inProgress));

      MediaResponse? mediaResponse;
      if (argument.isMovie) {
        mediaResponse = await _getMovieDetailUseCase.run(
          GetMovieDetailInput(
            movieId: argument.mediaId,
            movieKeys: [
              MovieDetailKeys.credits,
              MovieDetailKeys.images,
              MovieDetailKeys.similar,
            ],
          ),
        );
      } else {
        mediaResponse = await _getTvSeriesDetailUseCase.run(
          GetTvSeriesDetailInput(
            seriesId: argument.mediaId,
            tvSeriesKeys: [],
          ),
        );
      }

      emit(state.copyWith(
        status: AppStatus.success,
        media: mediaResponse,
      ));
    } on Exception catch (error) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: error.appError,
      ));
    }
  }
}
