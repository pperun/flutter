import 'dart:async';

import 'package:flutter/material.dart';

class DelayedSlideTransition extends StatefulWidget {
  final Tween<Offset> position;
  final Widget? child;
  final Duration delay;
  final Duration duration;

  const DelayedSlideTransition({
    super.key,
    required this.position,
    this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 0),
  });

  @override
  State<StatefulWidget> createState() => DelayedSlideTransitionState();
}

class DelayedSlideTransitionState extends State<DelayedSlideTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _controller.addListener(() {
      setState(() {});
    });
    Timer(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInCubic)),
      child: SlideTransition(
        position: widget.position.animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic)),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
