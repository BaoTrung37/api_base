import 'package:api_base/presentation/utilities/helpers/env_params.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${EnvParams.token}';
    handler.next(options);
  }
}