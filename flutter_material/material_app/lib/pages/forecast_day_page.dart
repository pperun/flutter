import 'package:flutter/material.dart';
import 'package:material_app/entities/hourly_weather.dart';
import 'package:material_app/widgets/glass_hourly_weather_meteo.dart';
import 'package:material_app/widgets/glass_hourly_weather_summary.dart';
import 'package:material_app/widgets/glass_weather_astro.dart';
import 'package:material_app/widgets/glass_weather_graph.dart';
import 'package:material_app/widgets/glass_weather_meteo.dart';
import 'package:material_app/widgets/flippable.dart';

import '../entities/forecast_day.dart';

class ForecastDayPage extends StatefulWidget {
  final ForecastDay weather;

  const ForecastDayPage({super.key, required this.weather});

  @override
  State<StatefulWidget> createState() => ForecastDayPageState();
}

class ForecastDayPageState extends State<ForecastDayPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Flippable(
              frontSide: GlassWeatherMeteo(weather: widget.weather.daySummary),
              backSide: GlassWeatherAstro(astro: widget.weather.astro),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final HourlyWeather hourlyWeather
                    in widget.weather.weatherByHours)
                  Row(
                    children: [
                      Flippable(
                        frontSide: GlassHourlyWeatherSummary(
                          hourlyWeather: hourlyWeather,
                        ),
                        backSide: GlassHourlyWeatherMeteo(
                          hourlyWeather: hourlyWeather,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
              ],
            ),
          ),
          GlassWeatherGraph(
            data: widget.weather.weatherByHours
                .map((e) => e.temperature)
                .toList(),
            caption: 'Temperature (°C)',
            bottomStartCaption: '00:00',
            bottomEndCaption: '23:59',    
          ),
          const SizedBox(
            height: 10,
          ),
          GlassWeatherGraph(
            data: widget.weather.weatherByHours
                .map((e) => e.windSpeed)
                .toList(),
            caption: 'Wind speed (KPH)',
            bottomStartCaption: '00:00',
            bottomEndCaption: '23:59',    
          ),
          const SizedBox(
            height: 10,
          ),
          GlassWeatherGraph(
            data: widget.weather.weatherByHours
                .map((e) => e.humidity.toDouble())
                .toList(),
            caption: 'Humidity (%)',
            bottomStartCaption: '00:00',
            bottomEndCaption: '23:59',    
          ),
          const SizedBox(
            height: 10,
          ),
          GlassWeatherGraph(
            data: widget.weather.weatherByHours
                .map((e) => e.pressure.toDouble())
                .toList(),
            caption: 'Pressure (%)',
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
