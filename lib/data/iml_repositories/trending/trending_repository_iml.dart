import 'package:api_base/data/models/media/media_response.dart';
import 'package:api_base/data/services/network_services/client/rest_client.dart';
import 'package:api_base/domain/repositories/trending/trending_repository.dart';
import 'package:api_base/presentation/utilities/enums/time_type.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrendingRepositoryIml extends TrendingRepository {
  TrendingRepositoryIml({
    required this.restClient,
  });
  final RestClient restClient;

  @override
  Future<List<MediaResponse>> getTrendingAllList({
    required int page,
    TimeType timeWindow = TimeType.day,
  }) async {
    final response = await restClient.getTrendingAll(timeWindow.name, page);
    return response.results;
  }

  @override
  Future<List<MediaResponse>> getTrendingMovieList({
    required int page,
    TimeType timeWindow = TimeType.day,
  }) async {
    final response = await restClient.getTrendingMovies(timeWindow.name, page);
    return response.results;
  }
}
