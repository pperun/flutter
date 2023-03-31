import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_app/models/tab_bar_model.dart';
import 'package:material_app/pages/forecast_day_page.dart';
import 'package:material_app/widgets/glass_tab_bar.dart';
import 'package:provider/provider.dart';

import '../entities/forecast.dart';
import '../entities/forecast_day.dart';
import '../widgets/glass_panel.dart';

class ForecastPage extends StatelessWidget {
  final Forecast forecast;

  const ForecastPage({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: forecast.days.length,
      initialIndex: Provider.of<TabBarModel>(context).currentIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GlassTabBar(
            isScrollable: true,
            labelPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            tabs: [
              for (ForecastDay day in forecast.days)
                GlassPanel(
                  padding: const EdgeInsets.all(10),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        DateFormat('dd.MM').format(day.daySummary.date),
                      ),
                      Text(
                        DateFormat('E').format(day.daySummary.date),
                      )
                    ],
                  ),
                ),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (ForecastDay day in forecast.days)
                  ForecastDayPage(weather: day)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
