import 'package:api_base/injection/di.dart';

class AppConfig {
  factory AppConfig.getInstance() {
    return _instance;
  }
  AppConfig._();

  static final AppConfig _instance = AppConfig._();

  Future<void> init() async {
    configureDependencies();
  }
}
