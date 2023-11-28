import 'package:api_base/data/iml_repositories/authentication/authentication.dart';
import 'package:api_base/data/models/responses/authentication/guest_session_response.dart';
import 'package:api_base/domain/use_cases/use_cases.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetGuestSessionUseCase extends FutureOutputUseCase<GuestSessionResponse> {
  final AuthenticationRepositoryIml utilsRepositoryImp;
  GetGuestSessionUseCase({
    required this.utilsRepositoryImp,
  });

  @override
  Future<GuestSessionResponse> run() async {
    return utilsRepositoryImp.getGuestSession();
  }
}
