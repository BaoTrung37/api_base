// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/data/models/models.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSimilarMovieListUseCase
    extends FutureUseCase<GetSimilarMovieListInput, List<MovieResponse>> {
  final MovieRepositoryIml movieRepositoryIml;
  GetSimilarMovieListUseCase({
    required this.movieRepositoryIml,
  });

  @override
  Future<List<MovieResponse>> run(GetSimilarMovieListInput input) {
    return movieRepositoryIml.getSimilarMovieList(
      page: input.page,
      movieId: input.movieId,
    );
  }
}

class GetSimilarMovieListInput {
  final int movieId;
  final int page;

  const GetSimilarMovieListInput({
    required this.movieId,
    required this.page,
  });
}
