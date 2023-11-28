import 'package:api_base/presentation/pages/home/screens/home_screen.dart';
import 'package:auto_route/auto_route.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}