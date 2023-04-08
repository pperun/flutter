import 'package:flutter/material.dart';
import 'package:material_app/providers/flippable_provider.dart';
import 'package:provider/provider.dart';

class Flippable extends StatelessWidget {
  final Widget frontSide;
  final Widget backSide;

  const Flippable(
      {super.key, required this.frontSide, required this.backSide});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: () => context.read<FlippableProvider>().flip(),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: context.watch<FlippableProvider>().side == Side.front ? frontSide : backSide,
        ),
      ),
    );
  }
}
