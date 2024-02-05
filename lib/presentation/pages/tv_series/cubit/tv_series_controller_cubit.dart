// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tv_series_controller_cubit.freezed.dart';
part 'tv_series_controller_state.dart';

@lazySingleton
class TvSeriesControllerCubit extends Cubit<TvSeriesControllerState> {
  TvSeriesControllerCubit(
    this._getAiringTodayTvSeriesListUseCase,
    this._getOnTheAirTvSeriesListUseCase,
    this._getPopularTvSeriesListUseCase,
    this._getTopRatedTvSeriesListUseCase,
  ) : super(const TvSeriesControllerState());

  final GetAiringTodayTvSeriesListUseCase _getAiringTodayTvSeriesListUseCase;
  final GetOnTheAirTvSeriesListUseCase _getOnTheAirTvSeriesListUseCase;
  final GetPopularTvSeriesListUseCase _getPopularTvSeriesListUseCase;
  final GetTopRatedTvSeriesListUseCase _getTopRatedTvSeriesListUseCase;

  Future<void> fetchData() async {
    try {
      emit(state.copyWith(status: AppStatus.inProgress));

      final responses = await Future.wait([
        fetchAiringTodayTvSeriesList(page: 1),
        fetchOnTheAirTvSeriesList(page: 1),
        fetchPopularTvSeriesList(page: 1),
        fetchTopRatedTvSeriesList(page: 1),
      ]);

      final airingTodayList = responses[0];
      final onTheAirList = responses[1];
      final popularList = responses[2];
      final topRatedList = responses[3];

      emit(state.copyWith(
        airingTodayList: airingTodayList,
        onTheAirList: onTheAirList,
        popularList: popularList,
        topRatedList: topRatedList,
        status: AppStatus.success,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: e.appError,
      ));
    }
  }

  Future<List<MediaResponse>> fetchAiringTodayTvSeriesList(
      {required int page}) async {
    return _getAiringTodayTvSeriesListUseCase.run(
      TvSeriesUseCaseInput(page: page),
    );
  }

  Future<List<MediaResponse>> fetchOnTheAirTvSeriesList(
      {required int page}) async {
    return _getOnTheAirTvSeriesListUseCase.run(
      TvSeriesUseCaseInput(page: page),
    );
  }

  Future<List<MediaResponse>> fetchPopularTvSeriesList(
      {required int page}) async {
    return _getPopularTvSeriesListUseCase.run(
      TvSeriesUseCaseInput(page: page),
    );
  }

  Future<List<MediaResponse>> fetchTopRatedTvSeriesList(
      {required int page}) async {
    return _getTopRatedTvSeriesListUseCase.run(
      TvSeriesUseCaseInput(page: page),
    );
  }
}
