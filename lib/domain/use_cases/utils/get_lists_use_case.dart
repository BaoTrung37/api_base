import 'package:api_base/data/iml_repositories/utils_repository_imp.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetListsUseCase extends FutureOutputUseCase<List<String?>?> {
  final UtilsRepositoryImp utilsRepositoryImp;
  GetListsUseCase({
    required this.utilsRepositoryImp,
  });

  @override
  Future<List<String?>?> run() async {
    return utilsRepositoryImp.getLists();
  }
}
