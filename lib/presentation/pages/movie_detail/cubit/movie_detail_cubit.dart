// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/media/media.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:api_base/presentation/pages/movie_detail/screen/movie_detail_screen.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'movie_detail_cubit.freezed.dart';
part 'movie_detail_state.dart';

@injectable
class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(
    this._getMovieDetailUseCase,
  ) : super(const MovieDetailState());

  final GetMovieDetailUseCase _getMovieDetailUseCase;

  Future<void> fetchData(MovieDetailArgument argument) async {
    try {
      emit(state.copyWith(status: AppStatus.inProgress));

      MediaResponse? mediaResponse;

      mediaResponse = await _getMovieDetailUseCase.run(
        GetMovieDetailInput(
          movieId: argument.movieId,
          movieKeys: [
            MovieDetailKeys.credits,
            MovieDetailKeys.images,
            MovieDetailKeys.similar,
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
