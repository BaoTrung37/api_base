import 'package:api_base/data/iml_repositories/tv_series/tv_series_repository_iml.dart';
import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/domain/use_cases/base/use_case.dart';
import 'package:api_base/presentation/utilities/enums/detail/tv_series_detail_keys.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTvSeriesDetailUseCase
    implements FutureUseCase<GetTvSeriesDetailInput, MediaResponse> {
  GetTvSeriesDetailUseCase(
    this._tvSeriesRepositoryIml,
  );

  final TvSeriesRepositoryIml _tvSeriesRepositoryIml;

  @override
  Future<MediaResponse> run(GetTvSeriesDetailInput input) {
    return _tvSeriesRepositoryIml.getTvSeriesDetail(seriesId: input.seriesId);
  }
}

class GetTvSeriesDetailInput {
  const GetTvSeriesDetailInput({
    required this.seriesId,
    this.tvSeriesKeys,
  });
  final int seriesId;
  final List<TvSeriesDetailKeys>? tvSeriesKeys;

  String? get appendToResponse {
    if (tvSeriesKeys != null) {
      return tvSeriesKeys!.map((e) => e.title).join(',').toString();
    }
    return null;
  }
}
