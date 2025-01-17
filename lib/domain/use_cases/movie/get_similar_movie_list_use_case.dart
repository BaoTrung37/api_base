// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/data/models/genres/genres_response.dart';
import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSimilarMovieListUseCase
    extends FutureUseCase<MovieUseCaseInput, List<MediaResponse>> {
  GetSimilarMovieListUseCase(
    this._movieRepositoryIml,
    this._genresRepositoryImp,
  );

  final MovieRepositoryIml _movieRepositoryIml;
  final GenresRepositoryImp _genresRepositoryImp;

  @override
  Future<List<MediaResponse>> run(MovieUseCaseInput input) async {
    await _genresRepositoryImp.getMovieGenresList();
    final responseList = await _movieRepositoryIml.getSimilarMovieList(
      page: input.page,
      movieId: input.movieId!,
    );
    final movieList = <MediaResponse>[];
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
