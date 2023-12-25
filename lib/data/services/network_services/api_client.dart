// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/services/network_services/dio_helper.dart';
import 'package:api_base/data/services/network_services/interceptors/auth_interceptor.dart';
import 'package:api_base/data/services/network_services/rest_client.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  RestClient restClient;

  ApiClient(this.restClient) {
    restClient = RestClient(
      DioHelper.createDio(interceptors: [
        AuthInterceptor(),
      ]),
    );
  }
}
