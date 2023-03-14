import 'package:material_app/models/weather_condition.dart';

class HourlyWeather {
  final DateTime time;
  final WeatherCondition condition;
  final double temperature;
  final double windSpeed;
  final double pressure;
  final int humidity;
  final int rainChance;

  HourlyWeather(
      {required this.time,
      required this.condition,
      required this.temperature,
      required this.windSpeed,
      required this.pressure,
      required this.humidity,
      required this.rainChance});
}
