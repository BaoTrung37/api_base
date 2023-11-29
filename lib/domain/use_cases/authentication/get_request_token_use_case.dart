// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:injectable/injectable.dart';

import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/domain/use_cases/base/use_case.dart';

@injectable
class GetRequestTokenUseCase extends FutureOutputUseCase<RequestTokenResponse> {
  final AuthenticationRepositoryIml authenticationRepositoryIml;
  GetRequestTokenUseCase({
    required this.authenticationRepositoryIml,
  });
  @override
  Future<RequestTokenResponse> run() {
    return authenticationRepositoryIml.getRequestToken();
  }
}
