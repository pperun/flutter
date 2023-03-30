import 'package:flutter/material.dart';
import 'app_swatches.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        highlightColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white70),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.white, fontSize: 48.0),
          titleLarge: TextStyle(color: Colors.white, fontSize: 24.0),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 16.0),
          bodySmall: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 16.0,
          ),
          unselectedLabelColor: Colors.white70,
          unselectedLabelStyle: TextStyle(
            fontSize: 16.0,
          ),
          labelPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10)
        ),
        primarySwatch: Swatches.blueSwatch,
      ),
      home: const HomePage(),
    );
  }
}
