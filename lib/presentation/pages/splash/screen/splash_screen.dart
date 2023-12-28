import 'package:api_base/data/services/preference_services/shared_preference_manager.dart';
import 'package:api_base/injection/di.dart';
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
    final sessionId = await getIt.get<SharedPreferencesManager>().getSession();
    if (sessionId != null) {
      if (context.mounted) {
        await context.replaceRoute(const MainAppRoute());
      }
    } else {
      if (context.mounted) {
        await context.replaceRoute(const LetInYouRoute());
      }
    }
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
