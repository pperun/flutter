import 'package:material_app/http/weather_api_client.dart';

import '../entities/forecast.dart';

class ForecastModel {
  Future<Forecast> getForecast() {
    return WeatherApiClient.getForecast();
  }
}