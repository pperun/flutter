import 'package:flutter/material.dart';

class CinemaTabBar extends StatelessWidget {
  final List<Widget> tabs;

  const CinemaTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      labelColor: Colors.black,
      indicatorColor: Colors.black,
      labelPadding: const EdgeInsets.all(0),
      physics: const BouncingScrollPhysics(),
      tabs: tabs,
    );
  }
}
