// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/data/models/genres/genres_response.dart';
import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSimilarTvSeriesListUseCase
    extends FutureUseCase<TvSeriesUseCaseInput, List<MediaResponse>> {
  GetSimilarTvSeriesListUseCase(
    this._tvSeriesRepositoryIml,
    this._genresRepositoryImp,
  );

  final TvSeriesRepositoryIml _tvSeriesRepositoryIml;
  final GenresRepositoryImp _genresRepositoryImp;

  @override
  Future<List<MediaResponse>> run(TvSeriesUseCaseInput input) async {
    await _genresRepositoryImp.getTvSeriesGenresList();
    final responseList = await _tvSeriesRepositoryIml.getSimilarList(
      page: input.page,
      seriesId: input.seriesId!,
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
