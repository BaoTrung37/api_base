// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/domain/use_cases/input/movie_use_case_input.dart';
import 'package:api_base/domain/use_cases/input/tv_series_use_case_input.dart';
import 'package:api_base/domain/use_cases/movie/movie.dart';
import 'package:api_base/domain/use_cases/tv_series/get_similar_tv_series_list_use_case.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'show_all_cubit.freezed.dart';
part 'show_all_state.dart';

@injectable
class ShowAllCubit extends Cubit<ShowAllState> {
  ShowAllCubit(
    this._getSimilarMovieListUseCase,
    this._getNowPlayingMovieListUseCase,
    this._getPopularMovieListUseCase,
    this._getTrendingMovieListUseCase,
    this._getUpcomingMovieListUseCase,
    this._getSimilarTvSeriesListUseCase,
  ) : super(const ShowAllState());

  final GetSimilarMovieListUseCase _getSimilarMovieListUseCase;
  final GetNowPlayingMovieListUseCase _getNowPlayingMovieListUseCase;
  final GetPopularMovieListUseCase _getPopularMovieListUseCase;
  final GetTrendingMovieListUseCase _getTrendingMovieListUseCase;
  final GetUpcomingMovieListUseCase _getUpcomingMovieListUseCase;

  final GetSimilarTvSeriesListUseCase _getSimilarTvSeriesListUseCase;

  Future<List<DataSource>> fetchData(
      ShowAllArgument allArgument, int page) async {
    final mediaId = allArgument.mediaId;
    emit(state.copyWith(status: AppStatus.inProgress));

    try {
      if (allArgument.apiMovieType != null) {
        switch (allArgument.apiMovieType) {
          case ApiMovieType.discover:
            return [];
          case ApiMovieType.popular:
            return getPopularMoviesData(page);
          case ApiMovieType.playingNow:
            return getNowPlayingMoviesData(page);
          case ApiMovieType.similar:
            return getSimilarMoviesData(mediaId, page);
          case ApiMovieType.trending:
            return getTrendingMoviesData(page);
          case ApiMovieType.upcoming:
            return getUpcomingMoviesData(page);
          case null:
            return [];
        }
      } else if (allArgument.apiTvSeriesType != null) {
        switch (allArgument.apiTvSeriesType) {
          case ApiTvSeriesType.popular:
          case ApiTvSeriesType.similar:
            return getSimilarTvSeriesData(mediaId, page);
          case null:
            return [];
        }
      }
    } on Exception catch (error) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: error.appError,
      ));
    }
    return [];
  }

  Future<List<DataSource>> getSimilarMoviesData(int? movieId, int page) async {
    emit(state.copyWith(status: AppStatus.inProgress));
    if (movieId == null) {
      return [];
    }
    try {
      final mediaList = await _getSimilarMovieListUseCase
          .run(MovieUseCaseInput(movieId: movieId, page: page));

      final dataSource = getMovieDataSources(mediaList);

      emit(state.copyWith(mediaList: mediaList, status: AppStatus.success));

      return dataSource;
    } on Exception catch (error) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: error.appError,
      ));
      return [];
    }
  }

  Future<List<DataSource>> getSimilarTvSeriesData(
      int? seriesId, int page) async {
    emit(state.copyWith(status: AppStatus.inProgress));
    if (seriesId == null) {
      return [];
    }
    try {
      final mediaList = await _getSimilarTvSeriesListUseCase
          .run(TvSeriesUseCaseInput(seriesId: seriesId, page: page));

      final dataSource = getMovieDataSources(mediaList);

      emit(state.copyWith(mediaList: mediaList, status: AppStatus.success));

      return dataSource;
    } on Exception catch (error) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: error.appError,
      ));
      return [];
    }
  }

  Future<List<DataSource>> getNowPlayingMoviesData(int page) async {
    emit(state.copyWith(status: AppStatus.inProgress));

    try {
      final mediaList = await _getNowPlayingMovieListUseCase
          .run(MovieUseCaseInput(page: page));

      final dataSource = getMovieDataSources(mediaList);

      emit(state.copyWith(mediaList: mediaList, status: AppStatus.success));

      return dataSource;
    } on Exception catch (error) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: error.appError,
      ));
      return [];
    }
  }

  Future<List<DataSource>> getPopularMoviesData(int page) async {
    emit(state.copyWith(status: AppStatus.inProgress));

    try {
      final mediaList =
          await _getPopularMovieListUseCase.run(MovieUseCaseInput(page: page));

      final dataSource = getMovieDataSources(mediaList);

      emit(state.copyWith(mediaList: mediaList, status: AppStatus.success));

      return dataSource;
    } on Exception catch (error) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: error.appError,
      ));
      return [];
    }
  }

  Future<List<DataSource>> getTrendingMoviesData(int page) async {
    emit(state.copyWith(status: AppStatus.inProgress));

    try {
      final mediaList =
          await _getTrendingMovieListUseCase.run(MovieUseCaseInput(page: page));

      final dataSource = getMovieDataSources(mediaList);

      emit(state.copyWith(mediaList: mediaList, status: AppStatus.success));

      return dataSource;
    } on Exception catch (error) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: error.appError,
      ));
      return [];
    }
  }

  Future<List<DataSource>> getUpcomingMoviesData(int page) async {
    emit(state.copyWith(status: AppStatus.inProgress));

    try {
      final mediaList =
          await _getUpcomingMovieListUseCase.run(MovieUseCaseInput(page: page));

      final dataSource = getMovieDataSources(mediaList);

      emit(state.copyWith(mediaList: mediaList, status: AppStatus.success));

      return dataSource;
    } on Exception catch (error) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: error.appError,
      ));
      return [];
    }
  }

  Future<List<DataSource>> getMovieDataSources(
    List<MediaResponse> dataList,
  ) async {
    final dataSource = dataList.map((e) => MovieCell(movie: e)).toList();

    return dataSource;
  }
}
