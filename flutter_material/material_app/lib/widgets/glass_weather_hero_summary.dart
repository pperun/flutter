import 'package:flutter/material.dart';
import 'package:material_app/pages/forecast_day_hero_page.dart';
import 'package:material_app/widgets/glass_weather_summary.dart';

import '../models/forecast_day.dart';

class GlassWeatherHeroSummary extends StatelessWidget {
  final String id;
  final ForecastDay weather;

  const GlassWeatherHeroSummary(
      {super.key, required this.id, required this.weather});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ForecastDayHeroPage(id: id, weather: weather),
          ),
        );
      },
      child: Hero(
        tag: id,
        child: Material(
          color: Colors.transparent,
          child: GlassWeatherSummary(id: id, weather: weather),
        ),
      ),
    );
  }
}
