import 'package:material_app/entities/astronomic_data.dart';
import 'package:material_app/entities/hourly_weather.dart';
import 'package:material_app/entities/weather.dart';

class ForecastDay {
  Weather daySummary;
  List<HourlyWeather> weatherByHours;
  AstronomicData astro;

  ForecastDay(
      {required this.daySummary,
      required this.weatherByHours,
      required this.astro});
}
