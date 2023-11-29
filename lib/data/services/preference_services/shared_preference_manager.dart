import 'package:api_base/data/services/preference_services/preference_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPreferencesManager {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesManager(this._sharedPreferences);

  ///Request Token
  Future<void> saveRequestToken({required String param}) async =>
      _sharedPreferences.setString(
        PreferenceKeys.requestToken.name,
        param,
      );

  Future<bool> removeRequestToken() async => _sharedPreferences.remove(
        PreferenceKeys.requestToken.name,
      );

  Future<String?> getRequestToken() async => _sharedPreferences.getString(
        PreferenceKeys.requestToken.name,
      );
}
