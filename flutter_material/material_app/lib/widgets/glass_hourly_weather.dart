import 'package:flutter/material.dart';
import 'package:material_app/models/hourly_weather.dart';
import 'package:material_app/widgets/glass_panel.dart';

class GlassHourlyWeather extends StatelessWidget {
  final HourlyWeather hourlyWeather;

  const GlassHourlyWeather({super.key, required this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      blur: 25,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '${hourlyWeather.time.hour.toString().padLeft(2, '0')}:${hourlyWeather.time.minute.toString().padLeft(2, '0')}',
              ),
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
