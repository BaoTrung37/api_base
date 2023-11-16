import 'package:api_base/injection/di.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  factory AppConfig.getInstance() {
    return _instance;
  }
  AppConfig._();

  static final AppConfig _instance = AppConfig._();

  Future<void> init() async {
    configureDependencies();
    await _loadEnv();
  }

  Future<void> _loadEnv() async {
    await dotenv.load();
  }
}
