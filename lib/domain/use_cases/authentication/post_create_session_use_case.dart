// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostCreateSessionUseCase
    extends FutureUseCase<PostCreateSessionInput, SessionResponse> {
  PostCreateSessionUseCase({
    required this.authenticationRepositoryIml,
  });

  final AuthenticationRepositoryIml authenticationRepositoryIml;

  @override
  Future<SessionResponse> run(PostCreateSessionInput input) {
    return authenticationRepositoryIml.postCreateSession(input);
  }
}

class PostCreateSessionInput {
  PostCreateSessionInput({
    this.requestToken,
    this.accessToken,
  });

  final String? requestToken;
  final String? accessToken;
}
