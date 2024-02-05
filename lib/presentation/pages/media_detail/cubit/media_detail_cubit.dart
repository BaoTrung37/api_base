// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/media/media.dart';
import 'package:api_base/domain/use_cases/media/get_media_detail_use_case.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'media_detail_cubit.freezed.dart';
part 'media_detail_state.dart';

@injectable
class MediaDetailCubit extends Cubit<MediaDetailState> {
  MediaDetailCubit(
    this._getMediaDetailUseCase,
  ) : super(const MediaDetailState());

  final GetMediaDetailUseCase _getMediaDetailUseCase;

  Future<void> fetchData(int movieId) async {
    try {
      emit(state.copyWith(status: AppStatus.inProgress));

      final mediaResponse =
          await _getMediaDetailUseCase.run(GetMediaDetailInput(
        movieId: movieId,
        movieKeys: [
          MovieKeys.credits,
          MovieKeys.images,
          MovieKeys.similar,
        ],
      ));

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
