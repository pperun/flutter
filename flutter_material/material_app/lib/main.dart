import 'package:flutter/material.dart';
import 'package:material_app/common/app_theme.dart';
import 'package:material_app/providers/forecast_provider.dart';
import 'package:material_app/providers/page_view_provider.dart';
import 'package:material_app/providers/settings_provider.dart';
import 'package:material_app/providers/theme_provider.dart';
import 'package:material_app/widgets/gradient_background_wrapper.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider(),
        ),
        ProxyProvider<SettingsProvider, ForecastProvider>(
          create: (context) => ForecastProvider(SettingsProvider()),
          update: (context, settings, forecast) => ForecastProvider(settings),
        ),
      ],
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<SettingsProvider, ThemeProvider>(
      create: (context) => ThemeProvider(SettingsProvider()),
      update: (context, settingsProvider, themeProvider) =>
          ThemeProvider(settingsProvider),
      builder: (context, child) => FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              title: 'Weather',
              theme: snapshot.data! ? darkTheme : lightTheme,
              home: ChangeNotifierProvider<PageViewProvider>(
                create: (context) => PageViewProvider(pages: 2),
                child: HomePage(),
              ),
            );
          } else {
            return const GradientBackgroundWrapper(
              colors: [Color(0xff78bcff), Color(0xff1564b2)],
            );
          }
        },
        future: Provider.of<ThemeProvider>(context).getDarkTheme(),
      ),
    );
  }
}
