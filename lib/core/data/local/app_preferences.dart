import 'package:dakwrite/core/utils/pref_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<bool> setToken(String? token) {
    return _sharedPreferences.setStringOrClear(_keyToken, token);
  }

  String? getToken() {
    return _sharedPreferences.getString(_keyToken);
  }

  Future clear() {
    return _sharedPreferences.clear();
  }

  /// Preferences Keys
  static const String _keyToken = 'token';
}
