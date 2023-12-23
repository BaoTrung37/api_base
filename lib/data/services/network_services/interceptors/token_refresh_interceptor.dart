// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/services/network_services/error/error.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenRefreshInterceptor extends InterceptorsWrapper {
  TokenRefreshInterceptor(
      // this.sharedPreferencesManager,
      // this.restClient,
      );

  // final SharedPreferencesManager sharedPreferencesManager;
  // final RestClient restClient;

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (!err.isTokenExpired) {
      return handler.next(err);
    }
    print('hahaah1');
    // Prevent call refresh token if user not logged in
    // final token = await sharedPreferencesManager.getRequestToken();
    // if (token == null) {
    //   return handler.reject(err);
    // }
  }
}
