import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {

  static const authKey = 'Authorization';

  LocalDataSource();

  Future<void> setToken(String token) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(authKey, token);
  }

  Future<String?> getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(authKey);
  }
}