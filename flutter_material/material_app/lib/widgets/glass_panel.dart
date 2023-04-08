import 'package:flutter/material.dart';

class GlassPanel extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Widget? child;

  const GlassPanel(
      {super.key,
      this.padding,
      BorderRadiusGeometry? borderRadius,
      this.color,
      this.child}) :
        borderRadius =
            borderRadius ?? const BorderRadius.all(Radius.circular(0));

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).primaryColor,
            borderRadius: borderRadius,
          ),
          padding: padding,
          child: child,
    );
  }
}
