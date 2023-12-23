// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/services/network_services/interceptors/token_refresh_interceptor.dart';
import 'package:api_base/injection/di.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioHelper {
  @factoryMethod
  Dio configApiDio() {
    final dio = Dio();
    dio
      ..options = BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      )
      ..interceptors.addAll(
        [
          getIt.get<TokenRefreshInterceptor>(),
          _DebugLogger(),
        ],
      );

    return dio;
  }
}

class _DebugLogger extends PrettyDioLogger {
  _DebugLogger()
      : super(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 1000,
        );
}
