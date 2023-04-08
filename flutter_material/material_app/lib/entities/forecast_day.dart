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

  ForecastDay.fromJson(Map<String, dynamic> json)
      : daySummary = Weather.fromJson(json),
        weatherByHours = [
          for (Map<String, dynamic> hour in json['hour'])
            HourlyWeather.fromJson(hour)
        ],
        astro = AstronomicData.fromJson(json);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> daySummaryJson = daySummary.toJson();
    return {
      'date': daySummaryJson['date'],
      'day': daySummaryJson['day'],
      'astro': astro.toJson(),
      'hour': [for (HourlyWeather hour in weatherByHours) hour.toJson()]
    };
  }
}
