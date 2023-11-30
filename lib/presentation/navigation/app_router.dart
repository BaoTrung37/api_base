import 'package:auto_route/auto_route.dart';

import 'package:api_base/presentation/pages/home/screens/home_screen.dart';
import 'package:api_base/presentation/pages/sign_in/screen/sign_in_screen.dart';
import 'package:api_base/presentation/pages/splash/screen/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SignInRoute.page),
      ];
}
