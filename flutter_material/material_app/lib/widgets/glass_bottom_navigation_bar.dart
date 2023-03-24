import 'package:flutter/material.dart';
import 'package:material_app/widgets/glass_panel.dart';

class GlassBottomNavigationBar extends StatelessWidget {
  final double blur;
  final int currentIndex;
  final void Function(int)? onTap;
  final List<BottomNavigationBarItem> items;

  const GlassBottomNavigationBar(
      {super.key,
      this.blur = 0,
      this.currentIndex = 0,
      required this.items,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      blur: blur,
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: onTap,
        items: items,
      ),
    );
  }
}
