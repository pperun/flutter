import 'package:flutter/material.dart';
import 'package:material_app/models/flippable_model.dart';
import 'package:provider/provider.dart';

class Flippable extends StatelessWidget {
  final Widget frontSide;
  final Widget backSide;

  const Flippable(
      {super.key, required this.frontSide, required this.backSide});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<FlippableModel>().flip(),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: context.watch<FlippableModel>().side == Side.front ? frontSide : backSide,
        ),
      ),
    );
  }
}
