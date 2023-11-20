import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/navigation/app_router.dart';
import 'package:flutter/material.dart';

import 'domain/use_cases/utils/get_genres_use_case.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
