import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/forecast.dart';
import '../widgets/glass_weather_hero_summary.dart';

class ForecastPage extends StatelessWidget {
  final Forecast forecast;

  const ForecastPage({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: forecast.days.length,
      itemBuilder: (context, index) {
        return GlassWeatherHeroSummary(
          id: const Uuid().v1(),
          weather: forecast.days[index],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
    );
  }
}
