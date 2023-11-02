import 'package:api_base/data/services/network_services/api_constants.dart';
import 'package:dio/dio.dart';

class CommonHeaderInterceptor extends Interceptor {
  CommonHeaderInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-RapidAPI-Key'] = ApiConstants.apiKey;
    options.headers['X-RapidAPI-Host'] = ApiConstants.apiHost;

    return handler.next(options);
  }
}
