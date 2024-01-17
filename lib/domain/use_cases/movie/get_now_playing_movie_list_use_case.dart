// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/data.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetNowPlayingMovieListUseCase
    extends FutureUseCase<GetNowPlayingMovieListInput, List<MovieResponse>> {
  GetNowPlayingMovieListUseCase({
    required this.movieRepositoryIml,
  });

  final MovieRepositoryIml movieRepositoryIml;

  @override
  Future<List<MovieResponse>> run(GetNowPlayingMovieListInput input) {
    return movieRepositoryIml.getNowPlayingMovieLists(
      page: input.page,
    );
  }
}

class GetNowPlayingMovieListInput {
  final int page;
  GetNowPlayingMovieListInput({
    required this.page,
  });
}
