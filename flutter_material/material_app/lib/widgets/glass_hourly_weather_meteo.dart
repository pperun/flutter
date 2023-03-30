import 'package:flutter/material.dart';
import 'package:material_app/entities/hourly_weather.dart';
import 'package:material_app/widgets/glass_panel.dart';

class GlassHourlyWeatherMeteo extends StatelessWidget {
  final HourlyWeather hourlyWeather;

  const GlassHourlyWeatherMeteo({super.key, required this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.air),
              Text('${hourlyWeather.windSpeed} KPH'),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.water),
              Text('${hourlyWeather.humidity} %'),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.thermostat_auto_rounded),
              Text('${hourlyWeather.pressure} mb'),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.umbrella_outlined),
              Text('${hourlyWeather.rainChance} %'),
            ],
          ),
        ],
      ),
    );
  }
}
