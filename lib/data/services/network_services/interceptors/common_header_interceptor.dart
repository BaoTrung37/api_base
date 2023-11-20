import 'package:dio/dio.dart';

class CommonHeaderInterceptor extends Interceptor {
  CommonHeaderInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['X-RapidAPI-Key'] = EnvParams.apiKey;
    // options.headers['X-RapidAPI-Host'] = EnvParams.apiHost;

    return handler.next(options);
  }
}
