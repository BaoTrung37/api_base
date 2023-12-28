import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/domain/use_cases/base/use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRequestTokenUseCase extends FutureOutputUseCase<RequestTokenResponse> {
  GetRequestTokenUseCase({
    required this.authenticationRepositoryIml,
  });

  final AuthenticationRepositoryIml authenticationRepositoryIml;

  @override
  Future<RequestTokenResponse> run() {
    return authenticationRepositoryIml.getRequestToken();
  }
}
