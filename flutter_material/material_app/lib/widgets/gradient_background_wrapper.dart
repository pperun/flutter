import 'package:flutter/material.dart';

class GradientBackgroundWrapper extends StatelessWidget {

  final Widget? child;
  
  const GradientBackgroundWrapper({super.key, this.child});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff75b4e3), Color(0xff2b235a)],
        ),
      ),
      child: child,
    );
  }

}