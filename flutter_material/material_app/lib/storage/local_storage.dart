import 'package:shared_preferences/shared_preferences.dart';


class LocalStorage {

  late final SharedPreferences sharedPreferences;

  void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  LocalStorage() {
    init();
  }

  String getString(String key) {
    return sharedPreferences.getString(key) ?? '';
  }

  void setString(String key, String value) {
    sharedPreferences.setString(key, value);
  }

  bool getDarkMode() {
    return sharedPreferences.getBool('darkMode') ?? false;
  }

  void setDarkMode(bool darkMode) {
    sharedPreferences.setBool('darkMode', darkMode);
  }

}