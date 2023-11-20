// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/utils_repository_imp.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetGenresUseCase extends FutureOutputUseCase<List<String?>?> {
  final UtilsRepositoryImp utilsRepositoryImp;
  GetGenresUseCase({
    required this.utilsRepositoryImp,
  });

  @override
  Future<List<String?>?> run() async {
    return utilsRepositoryImp.getGenres();
  }
}
