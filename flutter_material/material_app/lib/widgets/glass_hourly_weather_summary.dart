import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_app/entities/hourly_weather.dart';
import 'package:material_app/widgets/glass_panel.dart';

class GlassHourlyWeatherSummary extends StatelessWidget {
  final HourlyWeather hourlyWeather;

  const GlassHourlyWeatherSummary({super.key, required this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(DateFormat('HH:mm').format(hourlyWeather.time)),
          Image.network(
            hourlyWeather.condition.iconUrl,
            width: 48,
            height: 48,
          ),
          Row(
            children: [
              const Icon(Icons.thermostat_rounded),
              Text('${hourlyWeather.temperature} °C'),
            ],
          ),
        ],
      ),
    );
  }
}