import 'package:intl/intl.dart';
import 'package:material_app/entities/weather_condition.dart';

class Weather {
  final DateTime date;
  final WeatherCondition condition;
  final double maxTemperature;
  final double minTemperature;
  final double maxWindSpeed;
  final double averageHumidity;
  final int rainChance;

  Weather(
      {required this.date,
      required this.condition,
      required this.maxTemperature,
      required this.minTemperature,
      required this.maxWindSpeed,
      required this.averageHumidity,
      required this.rainChance});

  Weather.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['date']),
        condition = WeatherCondition.fromJson(json['day']['condition']),
        maxTemperature = json['day']['maxtemp_c'],
        minTemperature = json['day']['mintemp_c'],
        maxWindSpeed = json['day']['maxwind_kph'],
        averageHumidity = json['day']['avghumidity'],
        rainChance = json['day']['daily_chance_of_rain'];

  Map<String, dynamic> toJson() => {
        'date': DateFormat('yyyy-MM-dd').format(date),
        'day': {
          'maxtemp_c': maxTemperature,
          'mintemp_c': minTemperature,
          'maxwind_kph': maxWindSpeed,
          'avghumidity': averageHumidity,
          'daily_chance_of_rain': rainChance,
          'condition': condition.toJson()
        }
      };
}
