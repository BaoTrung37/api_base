// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/genres/genres_repository_imp.dart';
import 'package:api_base/data/models/models.dart';
import 'package:api_base/domain/use_cases/base/use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMovieGenresListUseCase extends FutureOutputUseCase<GenresResponse> {
  final GenresRepositoryImp genresRepositoryImp;

  GetMovieGenresListUseCase({
    required this.genresRepositoryImp,
  });

  @override
  Future<GenresResponse> run() {
    return genresRepositoryImp.getMovieGenresList();
  }
}
