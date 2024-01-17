// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:api_base/domain/use_cases/movie/movie.dart';
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
  ) : super(const ShowAllState());

  final GetSimilarMovieListUseCase _getSimilarMovieListUseCase;
  final GetNowPlayingMovieListUseCase _getNowPlayingMovieListUseCase;
  final GetPopularMovieListUseCase _getPopularMovieListUseCase;

  Future<List<DataSource>> fetchData(
      ShowAllArgument allArgument, int page) async {
    final movieId = allArgument.movieId;
    emit(state.copyWith(status: AppStatus.inProgress));

    try {
      if (allArgument.apiMovieType != null) {
        switch (allArgument.apiMovieType) {
          case ApiMovieType.discover:
            return [];
          case ApiMovieType.popular:
            return [];
          case ApiMovieType.playingNow:
            return getNowPlayingMoviesData(page);
          case ApiMovieType.similar:
            return getSimilarMoviesData(movieId, page);
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
      final movieList = await _getSimilarMovieListUseCase
          .run(GetSimilarMovieListInput(movieId: movieId, page: page));

      final dataSource = getMovieDataSources(movieList);

      emit(state.copyWith(movieList: movieList, status: AppStatus.success));

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
      final movieList = await _getNowPlayingMovieListUseCase
          .run(GetNowPlayingMovieListInput(page: page));

      final dataSource = getMovieDataSources(movieList);

      emit(state.copyWith(movieList: movieList, status: AppStatus.success));

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
    List<MovieResponse> dataList,
  ) async {
    final dataSource = dataList.map((e) => MovieCell(movie: e)).toList();

    return dataSource;
  }
}
