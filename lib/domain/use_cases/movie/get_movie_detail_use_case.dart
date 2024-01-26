// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/data/models/models.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:api_base/presentation/utilities/enums/movie_keys.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMovieDetailUseCase
    extends FutureUseCase<GetMovieDetailInput, MovieResponse?> {
  GetMovieDetailUseCase(this._movieRepositoryIml);

  final MovieRepositoryIml _movieRepositoryIml;

  @override
  Future<MovieResponse?> run(GetMovieDetailInput input) {
    return _movieRepositoryIml.getMovieDetail(
      movieId: input.movieId,
      appendToResponse: input.appendToResponse,
    );
  }
}

class GetMovieDetailInput {
  final int movieId;
  final List<MovieKeys>? movieKeys;

  const GetMovieDetailInput({
    required this.movieId,
    this.movieKeys,
  });

  String? get appendToResponse {
    if (movieKeys != null) {
      return movieKeys!.map((e) => e.title).join(',').toString();
    }
    return null;
  }
}
