// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';

import '../services/network_services/rest_client.dart';

@injectable
class ExRepositoryImp {
  final RestClient restClient;

  ExRepositoryImp({
    required this.restClient,
  });

  // @override
  // Future<List<String?>?> getGenres() async {
  //   final response = await restClient.getUtilGenres();
  //   return response.results;
  // }
}
