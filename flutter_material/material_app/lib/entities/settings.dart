class Setting {
  bool isSet;

  Setting(this.isSet);

  Setting.fromJson(Map<String, dynamic> json) : isSet = json['is_set'];

  Map<String, dynamic> toJson() => {'is_set': isSet};
}

class Settings {
  Map<String, Setting> settings;

  Settings(this.settings);

  Setting? get(String name) =>  settings[name];
  
  void set(String name, Setting setting) => settings[name] = setting;
  
  Settings.fromJson(Map<String, dynamic> json)
      : settings = json.map((key, value) => MapEntry(key, Setting.fromJson(value)));

  Map<String, dynamic> toJson() => settings.map((key, value) => MapEntry(key, value.toJson()));
}
