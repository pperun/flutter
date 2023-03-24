import 'dart:ui';

import 'package:flutter/material.dart';

class GlassPanel extends StatelessWidget {
  final double blur;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? padding;
  final List<Color> glassGradientColors;
  final Widget? child;

  const GlassPanel(
      {super.key,
      this.blur = 0,
      this.padding,
      BorderRadiusGeometry? borderRadius,
      List<Color>? glassGradientColors,
      this.child})
      : glassGradientColors =
            glassGradientColors ?? const [Colors.white24, Colors.white38],
        borderRadius =
            borderRadius ?? const BorderRadius.all(Radius.circular(0));

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: glassGradientColors,
            ),
            borderRadius: borderRadius,
          ),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}