import 'package:api_base/presentation/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1), () {
        checkIsLogin();
      });
    });
  }

  Future<void> checkIsLogin() async {
    await context.replaceRoute(const MainAppRoute());
    // final sessionId =
    //     await getIt.get<SharedPreferencesManager>().getSessionId();
    // if (sessionId != null) {
    //   if (context.mounted) {
    //     await context.replaceRoute(const MainAppRoute());
    //   }
    // } else {
    //   if (context.mounted) {
    //     await context.replaceRoute(const LetInYouRoute());
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
