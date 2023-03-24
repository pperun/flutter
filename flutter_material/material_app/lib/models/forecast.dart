import 'package:material_app/models/forecast_day.dart';
import 'package:material_app/models/hourly_weather.dart';
import 'package:material_app/models/location.dart';
import 'package:material_app/models/weather.dart';
import 'package:material_app/models/weather_condition.dart';

class Forecast {
  List<ForecastDay> days;

  Forecast({required this.days});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(days: <ForecastDay>[
      for (Map<String, dynamic> day in json['forecast']['forecastday'])
        ForecastDay(
            daySummary: Weather(
                location: Location.fromJson(json['location']),
                date: DateTime.parse(day['date']),
                condition: WeatherCondition.fromJson(day['day']['condition']),
                maxTemperature: day['day']['maxtemp_c'],
                minTemperature: day['day']['mintemp_c'],
                maxWindSpeed: day['day']['maxwind_kph'],
                averageHumidity: day['day']['avghumidity'],
                rainChance: day['day']['daily_chance_of_rain']),
            weatherByHours: [
              for (Map<String, dynamic> hour in day['hour'])
                HourlyWeather(
                    time: DateTime.parse(hour['time']),
                    condition: WeatherCondition.fromJson(hour['condition']),
                    temperature: hour['feelslike_c'],
                    windSpeed: hour['wind_kph'],
                    pressure: hour['pressure_mb'],
                    humidity: hour['humidity'],
                    rainChance: hour['chance_of_rain'])
            ])
    ]);
  }
}
