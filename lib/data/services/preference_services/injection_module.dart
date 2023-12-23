import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectionModule {
  // @Named('BaseUrl')
  // String get baseUrl => ApiConstants.baseUrl;

  // @lazySingleton
  // Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
