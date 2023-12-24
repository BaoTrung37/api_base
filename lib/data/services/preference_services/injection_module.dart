import 'package:api_base/data/services/network_services/dio_helper.dart';
import 'package:api_base/data/services/network_services/interceptors/auth_interceptor.dart';
import 'package:api_base/data/services/network_services/interceptors/token_refresh_interceptor.dart';
import 'package:api_base/data/services/preference_services/shared_preference_manager.dart';
import 'package:api_base/injection/di.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  Dio get dio {
    final tokenRefreshInterceptor = TokenRefreshInterceptor(
      sharedPreferencesManager: getIt<SharedPreferencesManager>(),
    );

    return DioHelper.createDio(
      interceptors: [
        tokenRefreshInterceptor,
        AuthInterceptor(),
      ],
    );
  }

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
