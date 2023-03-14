import 'package:flutter/material.dart';
import 'package:material_app/http/weather_api_client.dart';
import 'package:material_app/widgets/weather_hero_widget.dart';
import 'package:uuid/uuid.dart';

import '../models/forecast.dart';
import '../widgets/weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  PageController controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              TextButton.icon(
                icon: const Icon(Icons.today_rounded),
                label: const Text('Today'),
                onPressed: (() {
                  if (pageIndex != 0) {
                    pageIndex = 0;
                    setState(() {
                      controller.animateToPage(0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      Navigator.of(context).pop();
                    });
                  }
                }),
              ),
              TextButton.icon(
                icon: const Icon(Icons.grid_on_rounded),
                label: const Text('Forecast'),
                onPressed: (() {
                  if (pageIndex != 1) {
                    pageIndex = 1;
                    setState(() {
                      controller.animateToPage(1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      Navigator.of(context).pop();
                    });
                  }
                }),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Forecast forecast = snapshot.data as Forecast;
            return PageView(
              controller: controller,
              onPageChanged: (value) => setState(() {
                pageIndex = value;
              }),
              children: [
                WeatherWidget(weather: forecast.days[0]),
                ListView.builder(
                    itemCount: forecast.days.length,
                    itemBuilder: (context, index) {
                      return WeatherHeroWidget(
                          id: const Uuid().v1(), weather: forecast.days[index]);
                    }),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: client.getForecast(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageIndex == 0 ? pageIndex++ : pageIndex--;
          setState(() {
            controller.animateToPage(pageIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear);
          });
        },
        child: pageIndex == 0
            ? const Icon(Icons.keyboard_arrow_right_rounded)
            : const Icon(Icons.keyboard_arrow_left_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Theme.of(context).colorScheme.shadow,
          unselectedItemColor: Theme.of(context).colorScheme.shadow,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: pageIndex,
          onTap: (value) {
            if (value != pageIndex) {
              pageIndex == 0 ? pageIndex++ : pageIndex--;
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
