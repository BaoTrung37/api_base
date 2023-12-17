import 'package:api_base/presentation/pages/pages.dart';
import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: LetInYouRoute.page),
      ];
}
