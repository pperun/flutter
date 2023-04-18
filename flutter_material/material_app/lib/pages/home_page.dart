import 'package:flutter/material.dart';
import 'package:material_app/pages/locations_page.dart';
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
          child: FutureBuilder<List<Forecast>>(
            builder: (context, snapshot) {
              List<Forecast> forecasts;
              if (snapshot.hasError) {
                return RefreshIndicator(
                  onRefresh: () async {
                    try {
                      forecasts = await Provider.of<ForecastProvider>(context,
                              listen: false)
                          .getForecasts({'Kyiv', 'Paris'});
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
                forecasts = snapshot.data as List<Forecast>;
                return Consumer<PageViewProvider>(
                  builder: (context, model, child) => PageView(
                    controller: _controller,
                    onPageChanged: (value) {
                      model.currentIndex = value;
                    },
                    children: [
                      Navigator(
                        key: model.navigatorKeys[0],
                        initialRoute: '/',
                        onGenerateRoute: (settings) {
                          return MaterialPageRoute(
                            builder: (context) =>
                                ChangeNotifierProvider<TabBarProvider>(
                              create: (context) => TabBarProvider(),
                              child: ForecastPage(forecast: forecasts[0]),
                            ),
                          );
                        },
                      ),
                      Navigator(
                        key: model.navigatorKeys[1],
                        initialRoute: '/',
                        onGenerateRoute: (settings) {
                          switch (settings.name) {
                            case '/':
                              return MaterialPageRoute(
                                builder: (context) => LocationsPage(
                                  locations:
                                      forecasts.map((e) => e.location).toSet(),
                                ),
                              );
                            case '/location':
                              return MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider<TabBarProvider>(
                                  create: (context) => TabBarProvider(),
                                  child: FutureBuilder<Forecast>(
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ForecastPage(
                                            forecast: snapshot.data!);
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                    future: settings.arguments as Future<Forecast>
                                  ),
                                ),
                              );
                          }
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            future: context
                .watch<ForecastProvider>()
                .getForecasts({'Kyiv', 'Paris'}),
          ),
        ),
        bottomNavigationBar: Consumer<PageViewProvider>(
          builder: (context, model, child) => GlassBottomNavigationBar(
            currentIndex: model.currentIndex,
            onTap: (value) {
              if(value != model.currentIndex) {
                _controller.animateToPage(value,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn); 
              }
              else {
                model.currentIndex = value;
              }
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on_rounded), label: 'My location'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_location_alt_sharp), label: 'Locations'),
            ],
          ),
        ),
      ),
    );
  }
}
