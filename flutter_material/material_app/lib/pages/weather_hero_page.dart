import 'package:flutter/material.dart';
import 'package:material_app/widgets/weather_widget.dart';

import '../models/forecast_day.dart';

class WeatherHeroPage extends StatelessWidget {
  final String id;
  final ForecastDay weather;

  const WeatherHeroPage({super.key, required this.id, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Material(
        child: WeatherWidget(id: id, weather: weather, hero: true),
      ),
    );
  }
}
