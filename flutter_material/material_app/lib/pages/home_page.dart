import 'package:flutter/material.dart';
import 'package:material_app/http/weather_api_client.dart';
import 'package:material_app/pages/forecast_page.dart';
import 'package:material_app/widgets/glass_app_bar.dart';
import 'package:material_app/widgets/gradient_background_wrapper.dart';

import '../models/forecast.dart';
import '../widgets/glass_bottom_navigation_bar.dart';
import 'forecast_day_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherApiClient client = WeatherApiClient();
  final PageController controller = PageController();
  int pageIndex = 0;
  late final Future<Forecast> forecast;

  @override
  void initState() {
    super.initState();
    forecast = client.getForecast();
  }

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
                return PageView(
                  controller: controller,
                  onPageChanged: (value) => setState(() {
                    pageIndex = value;
                  }),
                  children: [
                    ForecastDayPage(weather: forecast.days[0]),
                    ForecastPage(forecast: forecast),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            future: forecast,
          ),
        ),
        bottomNavigationBar: GlassBottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (value) {
            if (value != pageIndex) {
              pageIndex == 1 ? pageIndex = 0 : pageIndex++;
              setState(() {
                controller.animateToPage(pageIndex,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              });
            }
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.today_rounded), label: 'Today'),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_on_rounded), label: 'Forecast'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
