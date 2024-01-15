// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/movie/movie_response.dart';
import 'package:api_base/domain/use_cases/movie/get_similar_movie_list_use_case.dart';
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
  ) : super(const ShowAllState());

  final GetSimilarMovieListUseCase _getSimilarMovieListUseCase;

  Future<List<DataSource>> getSimilarMoviesData(int? movieId, int page) async {
    emit(state.copyWith(status: AppStatus.inProgress));
    if (movieId == null) {
      return [];
    }
    try {
      final similarMovieList = await _getSimilarMovieListUseCase
          .run(GetSimilarMovieListInput(movieId: movieId, page: page));

      emit(state.copyWith(similarMovieList: similarMovieList));

      // fetch item
      final dataSource =
          similarMovieList.map((e) => MovieCell(movie: e)).toList();

      emit(state.copyWith(status: AppStatus.success));

      return dataSource;
    } on Exception catch (error) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: error.appError,
      ));
    }
    return [];
  }
}
