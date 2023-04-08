import 'package:flutter/material.dart';
import 'package:material_app/pages/settings_page.dart';
import 'package:material_app/providers/forecast_provider.dart';
import 'package:material_app/pages/forecast_page.dart';
import 'package:material_app/providers/tab_bar_provider.dart';
import 'package:material_app/widgets/glass_app_bar.dart';
import 'package:material_app/widgets/gradient_background_wrapper.dart';
import 'package:provider/provider.dart';

import '../entities/forecast.dart';
import '../providers/page_view_provider.dart';
import '../widgets/glass_bottom_navigation_bar.dart';
import 'forecast_day_page.dart';

class HomePage extends StatelessWidget {
  final PageController _controller = PageController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWrapper(
      colors: [
        Theme.of(context).primaryColorLight,
        Theme.of(context).primaryColorDark
      ],
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: GlassAppBar(
          title: Text('Weather', style: Theme.of(context).textTheme.titleLarge),
          iconTheme: Theme.of(context).iconTheme,
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              ),
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: SafeArea(
          child: FutureBuilder(
            builder: (context, snapshot) {
              Forecast forecast;
              if (snapshot.hasError) {
                return RefreshIndicator(
                  onRefresh: () async {
                    try {
                      forecast = await Provider.of<ForecastProvider>(context,
                              listen: false)
                          .getForecast();
                    } catch (e) {}
                  },
                  child: const CustomScrollView(
                    slivers: <Widget>[
                      SliverFillRemaining(
                        child: Center(
                          child: Text(
                              "Something went wrong. Please refresh the page."),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasData) {
                forecast = snapshot.data as Forecast;
                return Consumer<PageViewProvider>(
                  builder: (context, model, child) => PageView(
                    controller: _controller,
                    onPageChanged: (value) {
                      model.currentIndex = value;
                    },
                    children: [
                      ForecastDayPage(weather: forecast.days[0]),
                      ChangeNotifierProvider<TabBarProvider>(
                          create: (context) => TabBarProvider(),
                          child: ForecastPage(forecast: forecast)),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            future: context.watch<ForecastProvider>().getForecast(),
          ),
        ),
        bottomNavigationBar: Consumer<PageViewProvider>(
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
