// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';

import 'package:api_base/domain/repositories/utils/utils_repository.dart';

import '../services/network_services/rest_client.dart';

@injectable
class UtilsRepositoryImp implements UtilsRepository {
  final RestClient restClient;

  UtilsRepositoryImp({
    required this.restClient,
  });

  @override
  Future<List<String?>?> getGenres() async {
    final response = await restClient.getUtilGenres();
    return response.results;
  }

  @override
  Future<List<String?>?> getLists() async {
    final response = await restClient.getUtilLists();
    return response.results;
  }
}
