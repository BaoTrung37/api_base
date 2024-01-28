// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:api_base/domain/use_cases/input/movie_use_case_input.dart';
import 'package:api_base/domain/use_cases/movie/movie.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MoviesControllerCubit extends Cubit<MovieState> {
  MoviesControllerCubit(
    this._getNowPlayingMovieListUseCase,
    this._getPopularMovieListUseCase,
    this._getTrendingMovieListUseCase,
    this._getUpcomingMovieListUseCase,
  ) : super(const MovieState());

  final GetNowPlayingMovieListUseCase _getNowPlayingMovieListUseCase;
  final GetPopularMovieListUseCase _getPopularMovieListUseCase;
  final GetTrendingMovieListUseCase _getTrendingMovieListUseCase;
  final GetUpcomingMovieListUseCase _getUpcomingMovieListUseCase;

  Future<void> fetchData() async {
    try {
      emit(state.copyWith(status: AppStatus.inProgress));

      final responses = await Future.wait([
        fetchNowPlayMovies(page: 1),
        fetchPopularMovies(page: 1),
        fetchTrendingMovies(page: 1),
        fetchUpcomingMovies(page: 1),
      ]);

      final nowPlayingMovies = responses[0];
      final popularMovies = responses[1];
      final trendingMovies = responses[2];
      final upcomingMovies = responses[3];

      emit(state.copyWith(
        nowPlayingMovies: nowPlayingMovies,
        popularMovies: popularMovies,
        trendingMovies: trendingMovies,
        upcomingMovies: upcomingMovies,
        status: AppStatus.success,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: e.appError,
      ));
    }
  }

  Future<List<MovieResponse>> fetchNowPlayMovies({required int page}) async {
    return _getNowPlayingMovieListUseCase.run(
      MovieUseCaseInput(page: page),
    );
  }

  Future<List<MovieResponse>> fetchPopularMovies({required int page}) async {
    return _getPopularMovieListUseCase.run(
      MovieUseCaseInput(page: page),
    );
  }

  Future<List<MovieResponse>> fetchTrendingMovies({required int page}) async {
    return _getTrendingMovieListUseCase.run(
      MovieUseCaseInput(page: page),
    );
  }

  Future<List<MovieResponse>> fetchUpcomingMovies({required int page}) async {
    return _getUpcomingMovieListUseCase.run(
      MovieUseCaseInput(page: page),
    );
  }
}
