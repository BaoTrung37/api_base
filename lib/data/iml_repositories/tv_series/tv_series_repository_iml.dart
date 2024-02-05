// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/media/media_response.dart';
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
  Future<MediaResponse> getTvSeriesDetail({
    required int seriesId,
    String? appendToResponse,
  }) async {
    final response = await restClient.getTvSeriesDetail(
      seriesId,
      appendToResponse,
    );
    return response;
  }

  @override
  Future<List<MediaResponse>> getAiringTodayList({
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
  Future<List<MediaResponse>> getOnTheAirList({
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
  Future<List<MediaResponse>> getPopularList({
    required int page,
  }) async {
    final response = await restClient.getPopularTvSeries(
      page,
    );
    return response.results;
  }

  @override
  Future<List<MediaResponse>> getTopRatedList({
    required int page,
  }) async {
    final response = await restClient.getTopRatedTvSeries(
      page,
    );
    return response.results;
  }

  @override
  Future<List<MediaResponse>> getSimilarList({
    required int seriesId,
    required int page,
  }) {
    throw UnimplementedError();
  }
}
