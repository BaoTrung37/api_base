import 'package:api_base/injection/di.dart';
import 'package:api_base/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(AppConstant.deviceWidth, AppConstant.deviceHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: getAppTheme(Brightness.light),
        darkTheme: getAppTheme(Brightness.dark),
        themeMode: ThemeMode.dark,
        routerConfig: getIt<AppRouter>().config(),
      ),
    );
  }
}
