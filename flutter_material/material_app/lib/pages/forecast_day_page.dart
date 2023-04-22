import 'package:flutter/material.dart';
import 'package:material_app/widgets/delayed_slide_transition.dart';
import 'package:material_app/widgets/glass_hourly_weather_meteo.dart';
import 'package:material_app/widgets/glass_hourly_weather_summary.dart';
import 'package:material_app/widgets/glass_weather_astro.dart';
import 'package:material_app/widgets/glass_weather_graph.dart';
import 'package:material_app/widgets/glass_weather_meteo.dart';
import 'package:material_app/widgets/flippable.dart';
import 'package:provider/provider.dart';

import '../entities/forecast_day.dart';
import '../providers/flippable_provider.dart';

class ForecastDayPage extends StatefulWidget {
  final ForecastDay weather;

  const ForecastDayPage({super.key, required this.weather});

  @override
  State<StatefulWidget> createState() => ForecastDaypageState();
}

class ForecastDaypageState extends State<ForecastDayPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DelayedSlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: const Offset(0.0, 0.0),
            ),
            duration: const Duration(milliseconds: 300),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ChangeNotifierProvider<FlippableProvider>(
                create: (context) => FlippableProvider(),
                child: Consumer<FlippableProvider>(
                  builder: (context, value, child) => Flippable(
                    axis: Axis.vertical,
                    frontSide:
                        GlassWeatherMeteo(weather: widget.weather.daySummary),
                    backSide: GlassWeatherAstro(astro: widget.weather.astro),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < widget.weather.weatherByHours.length; i++)
                  Row(
                    children: [
                      ChangeNotifierProvider<FlippableProvider>(
                        create: (context) => FlippableProvider(),
                        child: Consumer<FlippableProvider>(
                          builder: (context, model, child) =>
                              DelayedSlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1.0, 0.0),
                              end: const Offset(0.0, 0.0),
                            ),
                            delay: Duration(milliseconds: 600 ~/ (i + 1) * i),
                            duration: Duration(milliseconds: 400 ~/ (i + 1)),
                            child: Flippable(
                              frontSide: GlassHourlyWeatherSummary(
                                hourlyWeather: widget.weather.weatherByHours[i],
                              ),
                              backSide: GlassHourlyWeatherMeteo(
                                hourlyWeather: widget.weather.weatherByHours[i],
                              ),
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
          DelayedSlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ),
            duration: const Duration(milliseconds: 300),
            child: GlassWeatherGraph(
              data: widget.weather.weatherByHours
                  .map((e) => e.temperature)
                  .toList(),
              caption: 'Temperature (°C)',
              bottomStartCaption: '00:00',
              bottomEndCaption: '23:59',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DelayedSlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ),
            duration: const Duration(milliseconds: 300),
            child: GlassWeatherGraph(
              data: widget.weather.weatherByHours
                  .map((e) => e.windSpeed)
                  .toList(),
              caption: 'Wind speed (KPH)',
              bottomStartCaption: '00:00',
              bottomEndCaption: '23:59',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DelayedSlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: const Offset(0.0, 0.0),
            ),
            duration: const Duration(milliseconds: 300),
            child: GlassWeatherGraph(
              data: widget.weather.weatherByHours
                  .map((e) => e.humidity.toDouble())
                  .toList(),
              caption: 'Humidity (%)',
              bottomStartCaption: '00:00',
              bottomEndCaption: '23:59',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
