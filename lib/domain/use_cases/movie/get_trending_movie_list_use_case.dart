// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/data.dart';
import 'package:api_base/data/models/genres/genres_response.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTrendingMovieListUseCase
    extends FutureUseCase<MovieUseCaseInput, List<MediaResponse>> {
  GetTrendingMovieListUseCase(
      this._movieRepositoryIml, this._genresRepositoryImp);

  final MovieRepositoryIml _movieRepositoryIml;
  final GenresRepositoryImp _genresRepositoryImp;
  @override
  Future<List<MediaResponse>> run(MovieUseCaseInput input) async {
    await _genresRepositoryImp.getMovieGenresList();
    final responseList = await _movieRepositoryIml.getPopularMovieList(
      page: input.page,
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

class GetTrendingMovieListInput {
  final int page;
  GetTrendingMovieListInput({
    required this.page,
  });
}
