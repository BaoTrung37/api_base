// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/data.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPopularMovieListUseCase
    extends FutureUseCase<GetPopularMovieListInput, List<MovieResponse>> {
  GetPopularMovieListUseCase({
    required this.movieListRepositoryImp,
  });

  final MovieListRepositoryImp movieListRepositoryImp;

  @override
  Future<List<MovieResponse>> run(GetPopularMovieListInput input) {
    return movieListRepositoryImp.getPopularMovieLists(
      page: input.page,
    );
  }
}

class GetPopularMovieListInput {
  final int page;
  GetPopularMovieListInput({
    required this.page,
  });
}
