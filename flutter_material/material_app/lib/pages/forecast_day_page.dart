import 'package:flutter/material.dart';
import 'package:material_app/models/hourly_weather.dart';
import 'package:material_app/widgets/glass_hourly_weather.dart';
import 'package:material_app/widgets/glass_weather_summary.dart';

import '../models/forecast_day.dart';

class ForecastDayPage extends StatelessWidget {
  final String id;
  final bool hero;
  final ForecastDay weather;

  const ForecastDayPage(
      {super.key, required this.weather, this.hero = false, this.id = ''});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            hero
                ? Hero(
                    tag: id,
                    child: Material(
                      color: Colors.transparent,
                      child: GlassWeatherSummary(
                        id: id,
                        weather: weather,
                      ),
                    ),
                  )
                : GlassWeatherSummary(
                    id: id,
                    weather: weather,
                  ),
            for (HourlyWeather hourlyWeather in weather.weatherByHours)
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: GlassHourlyWeather(
                  hourlyWeather: hourlyWeather,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
