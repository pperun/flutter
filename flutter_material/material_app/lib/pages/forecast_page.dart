import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_app/providers/tab_bar_provider.dart';
import 'package:material_app/pages/forecast_day_page.dart';
import 'package:material_app/widgets/delayed_slide_transition.dart';
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
      initialIndex: Provider.of<TabBarProvider>(context).currentIndex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DelayedSlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero,
            ),
            duration: const Duration(milliseconds: 300),
            child: GlassTabBar(
              isScrollable: true,
              labelPadding:
                  const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              tabs: [
                for (int i = 0; i < forecast.days.length; i++)
                  DelayedSlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(-1.0, 0.0),
                      end: const Offset(0.0, 0.0),
                    ),
                    delay: Duration(milliseconds: 600 ~/ (i + 1) * i),
                    duration: Duration(milliseconds: 300 ~/ (i + 1)),
                    child: GlassPanel(
                      padding: const EdgeInsets.all(10),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            DateFormat('dd.MM')
                                .format(forecast.days[i].daySummary.date),
                          ),
                          Text(
                            DateFormat('E')
                                .format(forecast.days[i].daySummary.date),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
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
