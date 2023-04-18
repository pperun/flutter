import 'package:flutter/material.dart';

class GradientBackgroundWrapper extends StatelessWidget {
  final Widget? child;
  final List<Color> colors;
  final BorderRadius borderRadius;

  const GradientBackgroundWrapper(
      {super.key,
      required this.colors,
      this.borderRadius = BorderRadius.zero,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
