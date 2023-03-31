import 'dart:convert';

import 'package:material_app/entities/forecast.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static String city = 'Kiev';
  static const String apiKey = '1443005cf85645e6bf9175801232802';
  static Uri forecastUrl = Uri.http('api.weatherapi.com', '/v1/forecast.json',
      {'key': apiKey, 'q': city, 'days': '9', 'aqi': 'no'});

  static Future<Forecast> getForecast() async {
    Forecast forecast;
    var response = await http.get(forecastUrl);
    response.statusCode == 200
        ? forecast = Forecast.fromJson(jsonDecode(response.body))
        : throw Exception('Fetch failed');
    return forecast;    
  }
}
