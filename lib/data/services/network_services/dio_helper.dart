import 'package:api_base/data/services/network_services/interceptors/common_header_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioHelper {
  static Dio configApiDio() => _createDio(
        options: BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
        interceptors: [
          CommonHeaderInterceptor(),
        ],
        loggerEnable: true,
      );
  static Dio _createDio({
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
