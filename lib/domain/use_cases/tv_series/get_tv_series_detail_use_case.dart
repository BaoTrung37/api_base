import 'package:api_base/data/iml_repositories/tv_series/tv_series_repository_iml.dart';
import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/domain/use_cases/base/use_case.dart';
import 'package:api_base/domain/use_cases/input/tv_series_use_case_input.dart';
import 'package:api_base/presentation/utilities/enums/detail/movie_detail_keys.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTvSeriesDetailUseCase
    implements FutureUseCase<TvSeriesUseCaseInput, MediaResponse> {
  GetTvSeriesDetailUseCase(
    this._tvSeriesRepositoryIml,
  );

  final TvSeriesRepositoryIml _tvSeriesRepositoryIml;

  @override
  Future<MediaResponse> run(TvSeriesUseCaseInput input) {
    return _tvSeriesRepositoryIml.getTvSeriesDetail(seriesId: input.seriesId!);
  }
}

class GetTvSeriesDetailInput {
  const GetTvSeriesDetailInput({
    required this.movieId,
    this.movieKeys,
  });
  final int movieId;
  final List<MovieDetailKeys>? movieKeys;

  String? get appendToResponse {
    if (movieKeys != null) {
      return movieKeys!.map((e) => e.title).join(',').toString();
    }
    return null;
  }
}
