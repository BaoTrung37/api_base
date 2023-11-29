// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';

import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';

@injectable
class PostCreateSessionWithLoginUseCase
    extends FutureUseCase<PostCreateSessionInput, RequestTokenResponse> {
  final AuthenticationRepositoryIml authenticationRepositoryIml;

  PostCreateSessionWithLoginUseCase({
    required this.authenticationRepositoryIml,
  });

  @override
  Future<RequestTokenResponse> run(PostCreateSessionInput input) {
    return authenticationRepositoryIml.postCreateSessionWithLogin(input);
  }
}

class PostCreateSessionInput {
  final String username;
  final String password;
  PostCreateSessionInput({
    required this.username,
    required this.password,
  });
}
