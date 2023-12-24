import 'package:api_base/data/services/network_services/dio_helper.dart';
import 'package:api_base/data/services/network_services/interceptors/interceptors.dart';
import 'package:api_base/data/services/network_services/rest_client.dart';
import 'package:api_base/data/services/preference_services/shared_preference_manager.dart';
import 'package:api_base/injection/di.config.dart';
import 'package:api_base/presentation/navigation/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@InjectableInit(
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  getIt.init();
  getIt.registerSingleton(AppRouter(navigatorKey: navigatorKey));
  getIt.registerLazySingleton<Dio>(
    () {
      final tokenRefreshInterceptor = TokenRefreshInterceptor(
        sharedPreferencesManager: getIt.get<SharedPreferencesManager>(),
      );

      return DioHelper.createDio(
        interceptors: [
          tokenRefreshInterceptor,
          AuthInterceptor(),
        ],
      );
    },
  );
  getIt.registerFactory<RestClient>(
    () => RestClient(
      getIt.get<Dio>(),
    ),
  );
}
