import 'package:api_base/data/data.dart';
import 'package:api_base/data/models/genres/genres_response.dart';
import 'package:api_base/data/models/tv_series/tv_series_response.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOnTheAirTvSeriesListUseCase
    extends FutureUseCase<TvSeriesUseCaseInput, List<TvSeriesResponse>> {
  GetOnTheAirTvSeriesListUseCase(
    this._tvSeriesRepositoryIml,
    this._genresRepositoryImp,
  );

  final TvSeriesRepositoryIml _tvSeriesRepositoryIml;
  final GenresRepositoryImp _genresRepositoryImp;

  @override
  Future<List<TvSeriesResponse>> run(TvSeriesUseCaseInput input) async {
    await _genresRepositoryImp.getTvSeriesGenresList();
    final responseList = await _tvSeriesRepositoryIml.getOnTheAirList(
      page: input.page,
    );
    final tvSeriesList = <TvSeriesResponse>[];
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
