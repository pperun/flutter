import 'package:material_app/models/location.dart';
import 'package:material_app/models/weather_condition.dart';

class Weather {
  final Location location;
  final DateTime date;
  final WeatherCondition condition;
  final double maxTemperature;
  final double minTemperature;
  final double maxWindSpeed;
  final double averageHumidity;
  final int rainChance;

  Weather(
      {required this.location,
      required this.date,
      required this.condition,
      required this.maxTemperature,
      required this.minTemperature,
      required this.maxWindSpeed,
      required this.averageHumidity,
      required this.rainChance});
}
