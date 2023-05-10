import 'package:flutter/material.dart';

class SquareTab extends StatelessWidget {
  final Widget child;

  const SquareTab({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
          ),
        ], borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
