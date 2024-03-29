import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_app/entities/hourly_weather.dart';
import 'package:material_app/widgets/glass_panel.dart';

class GlassHourlyWeather extends StatelessWidget {
  final HourlyWeather hourlyWeather;

  const GlassHourlyWeather({super.key, required this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('${hourlyWeather.windSpeed} KPH'),
                  const Icon(Icons.air),
                ],
              ),
              Row(
                children: [
                  Text('${hourlyWeather.humidity} %'),
                  const Icon(Icons.water),
                ],
              ),
              Row(
                children: [
                  Text('${hourlyWeather.pressure} mb'),
                  const Icon(Icons.thermostat_auto_rounded),
                ],
              ),
              Row(
                children: [
                  Text('${hourlyWeather.rainChance} %'),
                  const Icon(Icons.umbrella_outlined),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
