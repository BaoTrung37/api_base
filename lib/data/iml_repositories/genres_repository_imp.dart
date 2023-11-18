// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';

import 'package:api_base/domain/repositories/genres/genres_repository.dart';

import '../services/network_services/rest_client.dart';

@injectable
class GenresRepositoryImp implements GenresRepository {
  final RestClient restClient;

  GenresRepositoryImp({
    required this.restClient,
  });

  @override
  Future<List<String?>?> getUtilGenres() async {
    final response = await restClient.getUtilGenres();
    return response.results;
  }
}
