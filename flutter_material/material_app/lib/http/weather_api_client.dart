import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:material_app/entities/forecast.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const String apiKey = '1443005cf85645e6bf9175801232802';

  static Forecast parseJson(String responseBody) =>
      Forecast.fromJson(jsonDecode(responseBody));

  static Future<Forecast> getForecast(String city) async {
    Forecast forecast;

    Location location = await locationFromAddress(city).then((value) => value[0]);

    Uri forecastUrl = Uri.http('api.weatherapi.com', '/v1/forecast.json',
        {'key': apiKey, 'q': '${location.latitude},${location.longitude}', 'days': '9', 'aqi': 'no'});

    var response = await http.get(forecastUrl);

    if (response.statusCode == 200) {
      forecast = parseJson(response.body);
      return forecast;
    }

    return Future.error(Exception('Fetch failed'));
  }
}
