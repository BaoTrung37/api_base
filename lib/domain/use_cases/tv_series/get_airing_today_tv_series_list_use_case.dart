import 'package:api_base/data/data.dart';
import 'package:api_base/data/models/genres/genres_response.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAiringTodayTvSeriesListUseCase
    extends FutureUseCase<TvSeriesUseCaseInput, List<MediaResponse>> {
  GetAiringTodayTvSeriesListUseCase(
    this._tvSeriesRepositoryIml,
    this._genresRepositoryImp,
  );

  final TvSeriesRepositoryIml _tvSeriesRepositoryIml;
  final GenresRepositoryImp _genresRepositoryImp;

  @override
  Future<List<MediaResponse>> run(TvSeriesUseCaseInput input) async {
    await _genresRepositoryImp.getTvSeriesGenresList();
    final responseList = await _tvSeriesRepositoryIml.getAiringTodayList(
      page: input.page,
    );
    final tvSeriesList = <MediaResponse>[];
    for (final tvSeries in responseList) {
      final genres = <Genre>[];
      for (final element in tvSeries.genreIds) {
        final genre = _genresRepositoryImp.tvSeriesGenreMap[element];
        if (genre != null) {
          genres.add(genre);
        }
      }
      tvSeriesList.add(tvSeries.copyWith(genres: genres));
    }

    return tvSeriesList;
  }
}
