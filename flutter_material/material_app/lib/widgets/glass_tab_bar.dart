import 'package:flutter/material.dart';
import 'package:material_app/widgets/glass_panel.dart';

class GlassTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry labelPadding;
  final bool isScrollable;

  const GlassTabBar(
      {super.key,
      required this.controller,
      required this.tabs,
      this.isScrollable = false,
      this.borderRadius = BorderRadius.zero,
      this.labelPadding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: borderRadius,
      child: TabBar(
        labelPadding: labelPadding,
        controller: controller,
        isScrollable: isScrollable,
        indicatorColor: Theme.of(context).tabBarTheme.unselectedLabelColor,
        splashBorderRadius: const BorderRadius.all(Radius.circular(20)),
        tabs: tabs,
      ),
    );
  }
}
