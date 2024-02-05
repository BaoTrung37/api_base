import 'package:api_base/data/models/media/media_response.dart';

abstract class TvSeriesRepository {
  Future<MediaResponse> getTvSeriesDetail({
    required int seriesId,
    String? appendToResponse,
  });

  Future<List<MediaResponse>> getSimilarList({
    required int seriesId,
    required int page,
  });

  Future<List<MediaResponse>> getAiringTodayList({
    required int page,
    String? timezone,
  });

  Future<List<MediaResponse>> getOnTheAirList({
    required int page,
    String? timezone,
  });

  Future<List<MediaResponse>> getPopularList({
    required int page,
  });

  Future<List<MediaResponse>> getTopRatedList({
    required int page,
  });
}
