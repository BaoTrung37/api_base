import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:api_base/domain/use_cases/input/movie_use_case_input.dart';
import 'package:api_base/domain/use_cases/movie/get_now_playing_movie_list_use_case.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NowPlayingMovieCubit extends Cubit<MovieState> {
  NowPlayingMovieCubit(
    this._getNowPlayingMovieListUseCase,
  ) : super(const MovieState());

  final GetNowPlayingMovieListUseCase _getNowPlayingMovieListUseCase;

  Future<void> fetchData() async {
    try {
      emit(state.copyWith(status: AppStatus.inProgress));
      final response = await getMovies(page: 1);

      final moviesList = response;

      emit(state.copyWith(
        movies: moviesList,
        status: AppStatus.success,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: e.appError,
      ));
    }
  }

  Future<List<MovieResponse>> getMovies({required int page}) async {
    return _getNowPlayingMovieListUseCase.run(
      MovieUseCaseInput(page: page),
    );
  }
}
