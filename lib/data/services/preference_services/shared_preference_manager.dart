import 'package:api_base/data/services/preference_services/preference_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPreferencesManager {
  SharedPreferencesManager(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

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

  /// Session
  Future<void> saveSession({required String sessionId}) async =>
      _sharedPreferences.setString(PreferenceKeys.session.name, sessionId);

  Future<bool> removeSession() async => _sharedPreferences.remove(
        PreferenceKeys.session.name,
      );

  Future<String?> getSession() async => _sharedPreferences.getString(
        PreferenceKeys.session.name,
      );
}
