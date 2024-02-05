import 'package:api_base/data/models/models.dart';
import 'package:api_base/presentation/presentation.dart';

abstract class TrendingRepository {
  Future<List<MediaResponse>> getTrendingMovieList({
    required int page,
    TimeType timeWindow = TimeType.day,
  });
  Future<List<MediaResponse>> getTrendingAllList({
    required int page,
    TimeType timeWindow = TimeType.day,
  });
}
