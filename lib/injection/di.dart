import 'package:api_base/presentation/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@InjectableInit(
  preferRelativeImports: true,
)
void configureDependencies() {
  getIt.init();
  getIt.registerSingleton(AppRouter(navigatorKey: navigatorKey));
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return SharedPreferences.getInstance();
  });
}
