import 'package:flutter/material.dart';
import 'package:material_app/providers/settings_provider.dart';

import '../entities/settings.dart';

class ThemeProvider with ChangeNotifier {
  SettingsProvider settingsProvider;

  ThemeProvider(this.settingsProvider);

  Future<bool> getDarkTheme() async {
    return await settingsProvider
        .getSettings()
        .then((value) => value.get(SettingsValues.darkTheme.value)!.isSet);
  }

  Future<void> setDarkTheme(bool isSet) async {
    Settings settings = await settingsProvider.getSettings();

    settings.set(SettingsValues.darkTheme.value, Setting(isSet));
    settingsProvider.setSettings(settings);

    notifyListeners();
  }
}
