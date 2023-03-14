import 'package:flutter/material.dart';
import 'package:material_app/models/hourly_weather.dart';

import '../models/forecast_day.dart';

class WeatherWidget extends StatelessWidget {
  final String id;
  final bool hero;
  final ForecastDay weather;

  const WeatherWidget(
      {super.key, required this.weather, this.hero = false, this.id = ''});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                    '${weather.daySummary.date.day.toString().padLeft(2, '0')}.${weather.daySummary.date.month.toString().padLeft(2, '0')}.${weather.daySummary.date.year}'),
                hero
                    ? Hero(
                        tag: id,
                        child: Image.network(
                            weather.daySummary.condition.iconUrl,
                            width: 100,
                            height: 100,
                            scale: 0.5),
                      )
                    : Image.network(weather.daySummary.condition.iconUrl,
                        width: 100, height: 100, scale: 0.5),
                Text(weather.daySummary.condition.condition),
                Text(
                    '${weather.daySummary.location.city}, ${weather.daySummary.location.region}, ${weather.daySummary.location.country}'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          for (HourlyWeather hourlyWeather in weather.weatherByHours)
            Card(
              child: Container(
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
              ),
            ),
        ],
      ),
    ]);
  }
}
