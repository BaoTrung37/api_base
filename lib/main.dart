import 'dart:async';

import 'package:api_base/app.dart';
import 'package:api_base/config/app_config.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppConfig.getInstance().init();
    runApp(
      const MyApp(),
    );
  }, (error, stack) {
    debugPrint(error.toString());
  });
}
 