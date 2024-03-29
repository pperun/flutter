import 'dart:convert';

import 'package:material_app/http/weather_api_client.dart';
import 'package:material_app/providers/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/forecast.dart';
import '../entities/settings.dart';

class ForecastProvider {
  SettingsProvider settingsProvider;

  ForecastProvider(this.settingsProvider);

  Future<Forecast> getForecast(String city) async {
    Settings settings = await settingsProvider.getSettings();
    return settings.get(SettingsValues.alwaysFromApi.value)!.isSet
        ? getForecastFormApi(city)
        : getForecastFromCache(city);
  }

  Future<List<Forecast>> getForecasts(Set<String> locations) async {
    List<Forecast> forecasts = [];
    for(final location in locations) {
      forecasts.add(await getForecast(location));
    }
    return forecasts;
  }

  Future<void> setAlwaysFromApi(bool isSet) async {
    await settingsProvider.getSettings().then((settings) {
      settings.set(SettingsValues.alwaysFromApi.value, Setting(isSet));
      settingsProvider.setSettings(settings);
    });
  }

  Future<Forecast> getForecastFormApi(String city) async {
    try {
      return await WeatherApiClient.getForecast(city);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Forecast> getForecastFromCache(String city) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String? json = sharedPreferences.getString('forecast_cache_$city');
    Forecast forecast;

    if (json == null) {
      try {
        forecast = await WeatherApiClient.getForecast(city);
        json = jsonEncode(forecast.toJson());
        sharedPreferences.setString('forecast_cache_$city', json);
      } catch (e) {
        return Future.error(e);
      }
    }

    forecast = Forecast.fromJson(jsonDecode(json));

    if (DateTime.now().difference(forecast.lastUpdated).inHours > 1) {
      try {
        forecast = await WeatherApiClient.getForecast(city);
        sharedPreferences.setString('forecast_cache_$city', jsonEncode(forecast.toJson()));
      } catch (e) {
        return Future.error(e);
      }
    }

    return forecast;
  }
}
