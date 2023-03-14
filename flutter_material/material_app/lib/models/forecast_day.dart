import 'package:material_app/models/hourly_weather.dart';
import 'package:material_app/models/weather.dart';

class ForecastDay {
  Weather daySummary;
  List<HourlyWeather> weatherByHours;

  ForecastDay({required this.daySummary, required this.weatherByHours});
}