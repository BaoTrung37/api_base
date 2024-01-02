import 'package:api_base/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'popular_movie_cubit.freezed.dart';
part 'popular_movie_state.dart';

@lazySingleton
class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit() : super(const PopularMovieState());
}
