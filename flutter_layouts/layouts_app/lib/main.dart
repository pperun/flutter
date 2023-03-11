import 'package:flutter/material.dart';
import 'package:layouts_app/app_theme.dart';
import 'package:layouts_app/pages/feed_page.dart';

void main() {
  runApp(const MyInstagram());
}

class MyInstagram extends StatelessWidget {
  const MyInstagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Instagram',
      theme: ThemeData(
        primarySwatch: AppTheme.appSwatch,
      ),
      home: const FeedPage(),
    );
  }
}
