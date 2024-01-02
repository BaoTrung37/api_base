import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:api_base/domain/use_cases/movie_lists/get_popular_movie_list_use_case.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'movie_state.dart';
part 'popular_movie_cubit.freezed.dart';

@lazySingleton
class PopularMovieCubit extends Cubit<MovieState> {
  PopularMovieCubit(
    this._getPopularMovieListUseCase,
  ) : super(const MovieState());

  final GetPopularMovieListUseCase _getPopularMovieListUseCase;

  Future<void> init() async {
    try {
      //
      final response =
          await _getPopularMovieListUseCase.run(GetPopularMovieListInput());
      final moviesList = response.results;
      emit(state.copyWith(movies: moviesList));
    } catch (e) {
      //
    }
  }
}
