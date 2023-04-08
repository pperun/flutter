import 'package:flutter/material.dart';

class GradientBackgroundWrapper extends StatelessWidget {

  final Widget? child;
  final List<Color> colors;
  
  const GradientBackgroundWrapper({super.key, required this.colors, this.child});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: child,
    );
  }
}