import 'package:api_base/data/models/models.dart';
import 'package:api_base/domain/use_cases/movie/get_movie_detail_use_case.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'movie_detail_cubit.freezed.dart';
part 'movie_detail_state.dart';

@lazySingleton
class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(
    this._getMovieDetailUseCase,
  ) : super(const MovieDetailState());

  final GetMovieDetailUseCase _getMovieDetailUseCase;

  Future<void> fetchData(int movieId) async {
    try {
      emit(state.copyWith(status: AppStatus.inProgress));

      final movieResponse = await _getMovieDetailUseCase
          .run(GetMovieDetailInput(movieId: movieId));

      emit(state.copyWith(
        status: AppStatus.success,
        movieResponse: movieResponse,
      ));
    } on Exception catch (error) {
      emit(state.copyWith(
        status: AppStatus.error,
        appError: error.appError,
      ));
    }
  }
}
