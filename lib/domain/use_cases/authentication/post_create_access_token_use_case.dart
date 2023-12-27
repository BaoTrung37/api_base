// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/authentication/authentication_repository_iml.dart';
import 'package:api_base/data/models/authentication/access_token_response.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostCreateAccessTokenUseCase
    implements FutureUseCase<PostCreateAccessTokenInput, AccessTokenResponse> {
  final AuthenticationRepositoryIml authenticationRepositoryIml;

  PostCreateAccessTokenUseCase({
    required this.authenticationRepositoryIml,
  });

  @override
  Future<AccessTokenResponse> run(PostCreateAccessTokenInput input) {
    return authenticationRepositoryIml.createAccessToken(input);
  }
}

class PostCreateAccessTokenInput {
  final String requestToken;
  PostCreateAccessTokenInput({
    required this.requestToken,
  });
}
