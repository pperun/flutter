import 'package:intl/intl.dart';
import 'package:material_app/entities/weather_condition.dart';

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

  HourlyWeather.fromJson(Map<String, dynamic> json)
      : time = DateTime.parse(json['time']),
        condition = WeatherCondition.fromJson(json['condition']),
        temperature = json['feelslike_c'],
        windSpeed = json['wind_kph'],
        pressure = json['pressure_mb'],
        humidity = json['humidity'],
        rainChance = json['chance_of_rain'];

  Map<String, dynamic> toJson() => {
        'time': DateFormat('yyyy-MM-dd HH:mm').format(time),
        'condition': condition.toJson(),
        'feelslike_c': temperature,
        'wind_kph': windSpeed,
        'pressure_mb': pressure,
        'humidity': humidity,
        'chance_of_rain': rainChance
      };
}
