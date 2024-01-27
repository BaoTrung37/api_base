// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/data.dart';
import 'package:api_base/data/models/genres/genres.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPopularMovieListUseCase
    extends FutureUseCase<GetPopularMovieListInput, List<MovieResponse>> {
  GetPopularMovieListUseCase(
      this._movieRepositoryIml, this._genresRepositoryImp);

  final MovieRepositoryIml _movieRepositoryIml;
  final GenresRepositoryImp _genresRepositoryImp;

  @override
  Future<List<MovieResponse>> run(GetPopularMovieListInput input) async {
    await _genresRepositoryImp.getMovieGenresList();
    final responseList = await _movieRepositoryIml.getPopularMovieLists(
      page: input.page,
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

class GetPopularMovieListInput {
  final int page;
  GetPopularMovieListInput({
    required this.page,
  });
}
