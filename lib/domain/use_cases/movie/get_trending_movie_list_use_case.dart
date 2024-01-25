// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/data.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTrendingMovieListUseCase
    extends FutureUseCase<GetTrendingMovieListInput, List<MovieResponse>> {
  GetTrendingMovieListUseCase({
    required this.movieRepositoryIml,
  });

  final MovieRepositoryIml movieRepositoryIml;

  @override
  Future<List<MovieResponse>> run(GetTrendingMovieListInput input) {
    return movieRepositoryIml.getPopularMovieLists(
      page: input.page,
    );
  }
}

class GetTrendingMovieListInput {
  final int page;
  GetTrendingMovieListInput({
    required this.page,
  });
}
