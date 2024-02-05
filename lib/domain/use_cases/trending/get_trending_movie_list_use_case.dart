// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/trending/trending_repository_iml.dart';
import 'package:api_base/data/models/models.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:api_base/presentation/utilities/enums/time_type.dart';

class GetTrendingMovieListUseCase
    implements FutureUseCase<GetTrendingMovieListInput, List<MediaResponse>> {
  GetTrendingMovieListUseCase({required this.trendingRepositoryIml});

  final TrendingRepositoryIml trendingRepositoryIml;
  @override
  Future<List<MediaResponse>> run(GetTrendingMovieListInput input) {
    return trendingRepositoryIml.getTrendingMovieList(
      page: input.page,
      timeWindow: input.timeWindow,
    );
  }
}

class GetTrendingMovieListInput {
  final TimeType timeWindow;
  final int page;
  GetTrendingMovieListInput({
    required this.page,
    this.timeWindow = TimeType.day,
  });
}
