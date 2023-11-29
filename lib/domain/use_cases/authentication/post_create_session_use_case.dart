import 'package:api_base/data/iml_repositories/iml_repositories.dart';
import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostCreateSessionUseCase extends FutureOutputUseCase<SessionResponse> {
  final AuthenticationRepositoryIml authenticationRepositoryIml;

  PostCreateSessionUseCase({
    required this.authenticationRepositoryIml,
  });

  @override
  Future<SessionResponse> run() {
    return authenticationRepositoryIml.postCreateSession();
  }
}
