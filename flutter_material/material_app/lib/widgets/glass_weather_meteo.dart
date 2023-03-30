import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_app/widgets/glass_panel.dart';
import '../entities/weather.dart';

class GlassWeatherMeteo extends StatelessWidget {

  final Weather weather;
  
  const GlassWeatherMeteo({super.key, required this.weather});
  
  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(DateFormat('dd.MM.y').format(weather.date)),    
          Image.network(weather.condition.iconUrl,
              width: 100, height: 100, scale: 0.5),
          Text(weather.condition.condition),
          Text(
              '${weather.location.city}, ${weather.location.region}, ${weather.location.country}'),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.thermostat_rounded),
                    Text(
                        '${weather.maxTemperature} / ${weather.minTemperature} °C')
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.air),
                    Text('${weather.maxWindSpeed} KPH')
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.water),
                    Text('${weather.averageHumidity} %')
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.umbrella_outlined),
                    Text('${weather.rainChance} %')
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