import 'package:api_base/domain/use_cases/movie_lists/get_now_playing_movie_list_use_case.dart';
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
      final response = await _getNowPlayingMovieListUseCase.run(
        GetNowPlayingMovieListInput(page: 1),
      );

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
}
