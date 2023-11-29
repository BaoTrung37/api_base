import 'package:api_base/presentation/utilities/helpers/env_params.dart';
import 'package:dio/dio.dart';

class CommonHeaderInterceptor extends Interceptor {
  CommonHeaderInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['api_key'] = EnvParams.apiKey;
    return handler.next(options);
  }
}
