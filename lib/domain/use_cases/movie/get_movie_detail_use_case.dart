// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/data/models/models.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMovieDetailUseCase
    extends FutureUseCase<GetMovieDetailInput, MovieResponse> {
  final MovieRepositoryIml movieRepositoryIml;
  GetMovieDetailUseCase({
    required this.movieRepositoryIml,
  });

  @override
  Future<MovieResponse> run(GetMovieDetailInput input) {
    return movieRepositoryIml.getMovieDetail(
      movieId: input.movieId,
    );
  }
}

class GetMovieDetailInput {
  final String movieId;
  GetMovieDetailInput({
    required this.movieId,
  });
}
