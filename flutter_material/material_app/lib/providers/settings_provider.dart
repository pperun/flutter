import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/settings.dart';

class SettingsProvider with ChangeNotifier{
  Future<Settings> getSettings() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? json = sharedPreferences.getString('settings');
    if (json == null) {
      Settings settings = Settings({
        SettingsValues.darkTheme.value: Setting(false),
        SettingsValues.alwaysFromApi.value: Setting(false)
      });
      json = jsonEncode(settings.toJson());
      sharedPreferences.setString('settings', json);
    }

    return Settings.fromJson(jsonDecode(json));
  }

  Future<void> setSettings(Settings settings) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('settings', jsonEncode(settings.toJson()));
    notifyListeners();
  }
}

enum SettingsValues {
  darkTheme('Dark theme'),
  alwaysFromApi('Always load forecast from Api');

  final String value;

  const SettingsValues(this.value);
}
