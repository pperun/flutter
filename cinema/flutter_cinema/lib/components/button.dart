import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;

  const Button({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              blurStyle: BlurStyle.outer,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: child,
      ),
    );
  }
}
