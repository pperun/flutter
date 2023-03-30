import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_app/pages/forecast_day_page.dart';
import 'package:material_app/widgets/glass_tab_bar.dart';

import '../entities/forecast.dart';
import '../entities/forecast_day.dart';
import '../widgets/glass_panel.dart';

class ForecastPage extends StatefulWidget {
  final Forecast forecast;

  const ForecastPage({super.key, required this.forecast});

  @override
  State<StatefulWidget> createState() => ForecastPageState();
}

class ForecastPageState extends State<ForecastPage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _controller =
        TabController(length: widget.forecast.days.length, vsync: this);
    _controller.addListener(() {
      setState(() => _selectedIndex = _controller.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GlassTabBar(
          controller: _controller,
          isScrollable: true,
          labelPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          tabs: [
            for (ForecastDay day in widget.forecast.days)
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
            controller: _controller,
            children: [
              for (ForecastDay day in widget.forecast.days)
                ForecastDayPage(weather: day)
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
