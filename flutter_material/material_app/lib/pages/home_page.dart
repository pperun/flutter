import 'package:flutter/material.dart';
import 'package:material_app/models/forecast_model.dart';
import 'package:material_app/pages/forecast_page.dart';
import 'package:material_app/widgets/glass_app_bar.dart';
import 'package:material_app/widgets/gradient_background_wrapper.dart';
import 'package:provider/provider.dart';

import '../entities/forecast.dart';
import '../models/page_view_model.dart';
import '../widgets/glass_bottom_navigation_bar.dart';
import 'forecast_day_page.dart';

class HomePage extends StatelessWidget {
  final PageController _controller = PageController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWrapper(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: GlassAppBar(
          title: Text('Weather', style: Theme.of(context).textTheme.titleLarge),
        ),
        body: SafeArea(
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Forecast forecast = snapshot.data as Forecast;
                return Consumer<PageViewModel>(
                  builder: (context, model, child) => PageView(
                    controller: _controller,
                    onPageChanged: (value) => model.currentIndex = value,
                    children: [
                      ForecastDayPage(weather: forecast.days[0]),
                      ForecastPage(forecast: forecast),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            future: Provider.of<ForecastModel>(context).getForecast(),
          ),
        ),
        bottomNavigationBar: Consumer<PageViewModel>(
          builder: (context, model, child) => GlassBottomNavigationBar(
            currentIndex: model.currentIndex,
            onTap: (value) {
              model.currentIndex = value;
              _controller.animateToPage(value,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.today_rounded), label: 'Today'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_on_rounded), label: 'Forecast'),
            ],
          ),
        ),
      ),
    );
  }
}
