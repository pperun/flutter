import 'package:flutter/material.dart';
import 'package:material_app/pages/weather_hero_page.dart';

import '../models/forecast_day.dart';

class WeatherHeroWidget extends StatelessWidget {
  final String id;
  final ForecastDay weather;

  const WeatherHeroWidget({super.key, required this.id, required this.weather});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WeatherHeroPage(id: id, weather: weather)));
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Hero(
                    tag: id,
                    child: Image.network(
                      weather.daySummary.condition.iconUrl,
                      width: 48,
                      height: 48,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.thermostat_rounded),
                      Text('${weather.daySummary.maxTemperature} / ${weather.daySummary.minTemperature} °C'),
                    ],
                  ),
                ],
              ),
              Text(
                    '${weather.daySummary.date.day.toString().padLeft(2, '0')}.${weather.daySummary.date.month.toString().padLeft(2, '0')}.${weather.daySummary.date.year}',
                  ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text('${weather.daySummary.maxWindSpeed} KPH'),
                      const Icon(Icons.air),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${weather.daySummary.averageHumidity} %'),
                      const Icon(Icons.water),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${weather.daySummary.rainChance} %'),
                      const Icon(Icons.umbrella_outlined),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
