import 'package:flutter/material.dart';
import 'package:material_app/widgets/glass_panel.dart';

import '../models/forecast_day.dart';

class GlassWeatherSummary extends StatelessWidget {
  final String id;
  final ForecastDay weather;

  const GlassWeatherSummary({super.key, this.id = '', required this.weather});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
              '${weather.daySummary.date.day.toString().padLeft(2, '0')}.${weather.daySummary.date.month.toString().padLeft(2, '0')}.${weather.daySummary.date.year}'),
          Image.network(weather.daySummary.condition.iconUrl,
              width: 100, height: 100, scale: 0.5),
          Text(weather.daySummary.condition.condition),
          Text(
              '${weather.daySummary.location.city}, ${weather.daySummary.location.region}, ${weather.daySummary.location.country}'),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.thermostat_rounded),
                    Text(
                        '${weather.daySummary.maxTemperature} / ${weather.daySummary.minTemperature} °C')
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.air),
                    Text('${weather.daySummary.maxWindSpeed} KPH')
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.water),
                    Text('${weather.daySummary.averageHumidity} %')
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.umbrella_outlined),
                    Text('${weather.daySummary.rainChance} %')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
