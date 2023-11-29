import 'package:api_base/data/iml_repositories/authentication/authentication.dart';
import 'package:api_base/data/models/authentication/authentication.dart';
import 'package:api_base/domain/use_cases/base/use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetGuestSessionUseCase extends FutureOutputUseCase<GuestSessionResponse> {
  final AuthenticationRepositoryIml authenticationRepositoryIml;
  GetGuestSessionUseCase({
    required this.authenticationRepositoryIml,
  });

  @override
  Future<GuestSessionResponse> run() async {
    return authenticationRepositoryIml.getGuestSession();
  }
}
