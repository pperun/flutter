import 'package:flutter/material.dart';
import 'package:material_app/entities/hourly_weather.dart';
import 'package:material_app/widgets/glass_hourly_weather_meteo.dart';
import 'package:material_app/widgets/glass_hourly_weather_summary.dart';
import 'package:material_app/widgets/glass_weather_astro.dart';
import 'package:material_app/widgets/glass_weather_graph.dart';
import 'package:material_app/widgets/glass_weather_meteo.dart';
import 'package:material_app/widgets/flippable.dart';
import 'package:provider/provider.dart';

import '../entities/forecast_day.dart';
import '../providers/flippable_provider.dart';

class ForecastDayPage extends StatelessWidget {
  final ForecastDay weather;

  const ForecastDayPage({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: ChangeNotifierProvider<FlippableProvider>(
              create: (context) => FlippableProvider(),
              child: Consumer<FlippableProvider>(
                builder: (context, value, child) => Flippable(
                  axis: Axis.vertical,
                  frontSide: GlassWeatherMeteo(weather: weather.daySummary),
                  backSide: GlassWeatherAstro(astro: weather.astro),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final HourlyWeather hourlyWeather
                    in weather.weatherByHours)
                  Row(
                    children: [
                      ChangeNotifierProvider<FlippableProvider>(
                        create: (context) => FlippableProvider(),
                        child: Consumer<FlippableProvider>(
                          builder: (context, model, child) => Flippable(
                            frontSide: GlassHourlyWeatherSummary(
                              hourlyWeather: hourlyWeather,
                            ),
                            backSide: GlassHourlyWeatherMeteo(
                              hourlyWeather: hourlyWeather,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
              ],
            ),
          ),
          GlassWeatherGraph(
            data: weather.weatherByHours.map((e) => e.temperature).toList(),
            caption: 'Temperature (°C)',
            bottomStartCaption: '00:00',
            bottomEndCaption: '23:59',
          ),
          const SizedBox(
            height: 10,
          ),
          GlassWeatherGraph(
            data: weather.weatherByHours.map((e) => e.windSpeed).toList(),
            caption: 'Wind speed (KPH)',
            bottomStartCaption: '00:00',
            bottomEndCaption: '23:59',
          ),
          const SizedBox(
            height: 10,
          ),
          GlassWeatherGraph(
            data: weather.weatherByHours
                .map((e) => e.humidity.toDouble())
                .toList(),
            caption: 'Humidity (%)',
            bottomStartCaption: '00:00',
            bottomEndCaption: '23:59',
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
