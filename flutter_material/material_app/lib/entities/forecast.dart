import 'package:material_app/entities/forecast_day.dart';
import 'package:material_app/entities/location.dart';

class Forecast {
  final Location location;
  final List<ForecastDay> days;
  final DateTime lastUpdated;

  Forecast(
      {required this.location, required this.days, required this.lastUpdated});

  Forecast.fromJson(Map<String, dynamic> json)
      : location = Location.fromJson(json['location']),
        days = <ForecastDay>[
          for (Map<String, dynamic> day in json['forecast']['forecastday'])
            ForecastDay.fromJson(day)
        ],
        lastUpdated = DateTime.parse(json['current']['last_updated']);

  Map<String, dynamic> toJson() => {
        'location': location.toJson(),
        'forecast': {
          'forecastday': [for (ForecastDay day in days) day.toJson()]
        },
        'current': {'last_updated': lastUpdated.toString()}
      };
}
