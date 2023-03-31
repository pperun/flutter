import 'package:flutter/material.dart';
import 'package:material_app/common/app_theme.dart';
import 'package:material_app/models/forecast_model.dart';
import 'package:material_app/models/page_view_model.dart';
import 'package:material_app/models/tab_bar_model.dart';
import 'package:provider/provider.dart';
import 'models/flippable_model.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FlippableModel()),
        ChangeNotifierProvider(create: (context) => TabBarModel()),
        ChangeNotifierProvider(create:(context) => PageViewModel()),
        Provider(create: (context) => ForecastModel())
      ],
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: appTheme,
      home: HomePage(),
    );
  }
}
