// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/media/media.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tv_series_detail_cubit.freezed.dart';
part 'tv_series_detail_state.dart';

@injectable
class TvSeriesDetailCubit extends Cubit<TvSeriesDetailState> {
  TvSeriesDetailCubit(
    this._getTvSeriesDetailUseCase,
  ) : super(const TvSeriesDetailState());

  final GetTvSeriesDetailUseCase _getTvSeriesDetailUseCase;

  Future<void> fetchData(TvSeriesDetailArgument argument) async {
    try {
      emit(state.copyWith(status: AppStatus.inProgress));

      MediaResponse? mediaResponse;

      mediaResponse = await _getTvSeriesDetailUseCase.run(
        GetTvSeriesDetailInput(
          seriesId: argument.seriesId,
          tvSeriesKeys: [
            TvSeriesDetailKeys.similar,
            TvSeriesDetailKeys.recommendations,
            TvSeriesDetailKeys.credits,
          ],
        ),
      );

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
