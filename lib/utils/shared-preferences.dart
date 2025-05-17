import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _firstTime = 'first_time_login';
  static const String _tokenKey = 'auth_token';
  static const String _userId = 'user_id';
  static const String isLoggedIn = 'is_loggedIn';

  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    prefs.setBool(isLoggedIn, true);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> setId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_userId, id);
  }

  static Future<int?> getId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userId);
  }

  static Future<bool?> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedIn);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userId);
    await prefs.remove(isLoggedIn);
  }

  static Future<bool> isTokenAvailable() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(_tokenKey) != null) {
      return false;
    }

    return true;
  }

  static Future<void> setFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstTime, false);
  }

  static Future<bool?> getFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstTime);
  }
}
