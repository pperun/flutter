import 'package:flutter/material.dart';
import 'package:material_app/pages/forecast_day_page.dart';
import 'package:material_app/widgets/gradient_background_wrapper.dart';

import '../models/forecast_day.dart';
import '../widgets/glass_app_bar.dart';

class ForecastDayHeroPage extends StatelessWidget {
  final String id;
  final ForecastDay weather;

  const ForecastDayHeroPage(
      {super.key, required this.id, required this.weather});

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: GlassAppBar(
          title: Text('Weather', style: Theme.of(context).textTheme.titleLarge),
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: SafeArea(
          child: ForecastDayPage(id: id, weather: weather, hero: true),
        ),
      ),
    );
  }
}
