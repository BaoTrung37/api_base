import 'package:api_base/data/models/models.dart';
import 'package:api_base/presentation/presentation.dart';

abstract class TrendingRepository {
  Future<List<MovieResponse>> getTrendingMovieList({
    required int page,
    TimeType timeWindow = TimeType.day,
  });
  Future<List<MovieResponse>> getTrendingAllList({
    required int page,
    TimeType timeWindow = TimeType.day,
  });
}
