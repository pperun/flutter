import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import '../bloc/flip_cubit/flip_cubit.dart';

class Flippable extends StatelessWidget {
  final Axis axis;
  final Widget frontSide;
  final Widget backSide;

   const Flippable(
      {super.key,
      required this.frontSide,
      required this.backSide,
      this.axis = Axis.horizontal});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 300),
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeIn.flipped,
        transitionBuilder: (child, animation) {
          final rotationAnimation =
              Tween<double>(begin: math.pi, end: 0.0).animate(animation);
          return AnimatedBuilder(
              animation: rotationAnimation,
              child: child,
              builder: (context, child) {
                return Transform(
                    transform: axis == Axis.horizontal
                        ? Matrix4.rotationY(rotationAnimation.value)
                        : Matrix4.rotationX(rotationAnimation.value),
                    alignment: Alignment.center,
                    child: rotationAnimation.value <= math.pi / 2
                        ? child
                        : Container());
              });
        },
        duration: const Duration(milliseconds: 300),
        child: context.read<FlipCubit>().state
            ? backSide
            : frontSide,
      ),
    );
  }
}