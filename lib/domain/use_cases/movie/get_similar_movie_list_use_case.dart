// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/data/models/genres/genres_response.dart';
import 'package:api_base/data/models/models.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSimilarMovieListUseCase
    extends FutureUseCase<GetSimilarMovieListInput, List<MovieResponse>> {
  GetSimilarMovieListUseCase(
    this._movieRepositoryIml,
    this._genresRepositoryImp,
  );

  final MovieRepositoryIml _movieRepositoryIml;
  final GenresRepositoryImp _genresRepositoryImp;

  @override
  Future<List<MovieResponse>> run(GetSimilarMovieListInput input) async {
    await _genresRepositoryImp.getMovieGenresList();
    final responseList = await _movieRepositoryIml.getSimilarMovieList(
      page: input.page,
      movieId: input.movieId,
    );
    final movieList = <MovieResponse>[];
    for (final movie in responseList) {
      final genres = <Genre>[];
      for (final element in movie.genreIds) {
        final genre = _genresRepositoryImp.movieGenreMap[element];
        if (genre != null) {
          genres.add(genre);
        }
      }
      movieList.add(movie.copyWith(genres: genres));
    }

    return movieList;
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
