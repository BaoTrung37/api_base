import 'dart:async';

import 'package:api_base/app.dart';
import 'package:api_base/config/app_config.dart';
import 'package:api_base/config/observer/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppConfig.getInstance().init();
    Bloc.observer = MyBlocObserver();
    runApp(
      const MyApp(),
    );
  }, (error, stack) {
    debugPrint(error.toString());
  });
}
