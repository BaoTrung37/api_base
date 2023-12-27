import 'package:api_base/data/services/network_services/interceptors/interceptors.dart';
import 'package:api_base/injection/di.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioHelper {
  @factoryMethod
  Dio configApiDio() => _createDio(
        options: BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
        interceptors: [
          getIt<AuthInterceptor>(),
          getIt<TokenRefreshInterceptor>(),
          _DebugLogger(),
        ],
        loggerEnable: true,
      );

  Dio _createDio({
    required BaseOptions options,
    List<Interceptor>? interceptors,
    bool loggerEnable = false,
  }) {
    final dio = Dio();
    dio.options = options;

    if (interceptors != null) {
      dio.interceptors.addAll(
        [...interceptors],
      );
    }

    if (loggerEnable) {
      dio.interceptors.add(_DebugLogger());
    }
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
