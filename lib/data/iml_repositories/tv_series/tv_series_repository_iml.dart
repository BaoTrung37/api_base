// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/tv_series/tv_series_response.dart';
import 'package:api_base/data/services/network_services/client/rest_client.dart';
import 'package:api_base/domain/repositories/tv_series/tv_series_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TvSeriesRepositoryIml extends TvSeriesRepository {
  final RestClient restClient;
  TvSeriesRepositoryIml({
    required this.restClient,
  });

  @override
  Future<TvSeriesResponse> getTvSeriesDetail({
    required int seriesId,
    String? appendToResponse,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<TvSeriesResponse>> getAiringTodayList({
    required int page,
    String? timezone,
  }) async {
    final response = await restClient.getAiringTodayTvSeries(
      page,
      timezone,
    );
    return response.results;
  }

  @override
  Future<List<TvSeriesResponse>> getOnTheAirList({
    required int page,
    String? timezone,
  }) async {
    final response = await restClient.getOnTheAirTvSeries(
      page,
      timezone,
    );
    return response.results;
  }

  @override
  Future<List<TvSeriesResponse>> getPopularList({
    required int page,
  }) async {
    final response = await restClient.getPopularTvSeries(
      page,
    );
    return response.results;
  }

  @override
  Future<List<TvSeriesResponse>> getTopRatedList({
    required int page,
  }) async {
    final response = await restClient.getTopRatedTvSeries(
      page,
    );
    return response.results;
  }

  @override
  Future<List<TvSeriesResponse>> getSimilarList({
    required int seriesId,
    required int page,
  }) {
    throw UnimplementedError();
  }
}
