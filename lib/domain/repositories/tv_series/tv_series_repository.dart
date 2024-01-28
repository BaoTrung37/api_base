import 'package:api_base/data/models/tv_series/tv_series_response.dart';

abstract class TvSeriesRepository {
  Future<TvSeriesResponse> getTvSeriesDetail({
    required int seriesId,
    String? appendToResponse,
  });

  Future<List<TvSeriesResponse>> getSimilarList({
    required int seriesId,
    required int page,
  });

  Future<List<TvSeriesResponse>> getAiringTodayList({
    required int page,
    String? timezone,
  });

  Future<List<TvSeriesResponse>> getOnTheAirList({
    required int page,
    String? timezone,
  });

  Future<List<TvSeriesResponse>> getPopularList({
    required int page,
  });

  Future<List<TvSeriesResponse>> getTopRatedList({
    required int page,
  });
}
