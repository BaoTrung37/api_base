// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/services/network_services/error/error.dart';
import 'package:api_base/data/services/preference_services/shared_preference_manager.dart';
import 'package:dio/dio.dart';

class TokenRefreshInterceptor extends InterceptorsWrapper {
  TokenRefreshInterceptor({
    required this.sharedPreferencesManager,
  });

  final SharedPreferencesManager sharedPreferencesManager;

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (!err.isTokenExpired) {
      return handler.next(err);
    }
    // Prevent call refresh token if user not logged in
    // final token = await sharedPreferencesManager.getRequestToken();
    // if (token == null) {
    //   return handler.reject(err);
    // }
  }
}
