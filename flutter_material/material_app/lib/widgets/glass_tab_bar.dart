import 'package:flutter/material.dart';
import 'package:material_app/widgets/glass_panel.dart';

class GlassTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry labelPadding;
  final bool isScrollable;

  const GlassTabBar(
      {super.key,
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
        isScrollable: isScrollable,
        indicatorColor: Theme.of(context).tabBarTheme.unselectedLabelColor,
        splashBorderRadius: const BorderRadius.all(Radius.circular(20)),
        tabs: tabs,
      ),
    );
  }
}
