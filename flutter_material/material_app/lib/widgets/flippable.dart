import 'package:flutter/material.dart';

class Flippable extends StatefulWidget {
  final Widget frontSide;
  final Widget backSide;

  const Flippable(
      {super.key, required this.frontSide, required this.backSide});

  @override
  State<StatefulWidget> createState() => FlippableState();
}

class FlippableState extends State<Flippable> {
  int _selectedWidget = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() {
        _selectedWidget = _selectedWidget == 0 ? 1 : 0;
      }),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _selectedWidget == 0 ? widget.frontSide : widget.backSide,
        ),
      ),
    );
  }
}
