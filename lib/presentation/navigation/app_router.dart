import 'package:api_base/presentation/pages/api_test/api_test_screen.dart';
import 'package:api_base/presentation/pages/pages.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LetInYouRoute.page),
        AutoRoute(
          page: MainAppRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(page: ProfileRoute.page),
            AutoRoute(page: MovieDetailRoute.page)
          ],
        ),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ApiTestRoute.page),
      ];
}
