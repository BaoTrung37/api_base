// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_base/data/data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class CommonHeaderInterceptor extends Interceptor {
  CommonHeaderInterceptor(
    this.sharedPreferencesManager,
  );
  final SharedPreferencesManager sharedPreferencesManager;
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final language = await sharedPreferencesManager.getLanguage() ?? 'vi';
    options.queryParameters['language'] = language;
    return handler.next(options);
  }
}
