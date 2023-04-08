import 'dart:convert';

import 'package:material_app/entities/forecast.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static String city = 'Kiev';
  static const String apiKey = '1443005cf85645e6bf9175801232802';
  static Uri forecastUrl = Uri.http('api.weatherapi.com', '/v1/forecast.json',
      {'key': apiKey, 'q': city, 'days': '9', 'aqi': 'no'});

  static Forecast parseJson(String responseBody) =>
      Forecast.fromJson(jsonDecode(responseBody));

  static Future<Forecast> getForecast() async {
    Forecast forecast;
    var response = await http.get(forecastUrl);

    if(response.statusCode == 200) {
      forecast = parseJson(response.body);
      return forecast;
    }
    
    return Future.error(Exception('Fetch failed'));
  }
}
