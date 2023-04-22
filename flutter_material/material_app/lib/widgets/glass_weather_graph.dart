import 'package:flutter/material.dart';
import 'package:material_app/widgets/glass_panel.dart';
import 'package:material_app/widgets/painters/graph_painter.dart';

class GlassWeatherGraph extends StatefulWidget {
  final List<double> data;
  final String caption;
  final String bottomStartCaption;
  final String bottomEndCaption;

  const GlassWeatherGraph(
      {super.key,
      required this.data,
      required this.caption,
      this.bottomStartCaption = '',
      this.bottomEndCaption = ''});

  @override
  State<StatefulWidget> createState() => GlassWeatherGraphState();
}

class GlassWeatherGraphState extends State<GlassWeatherGraph>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GlassPanel(
        padding: const EdgeInsets.all(10),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Column(
          children: [
            Text(widget.caption),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: CustomPaint(
                willChange: true,
                painter: GraphPainter(
                  animation: Tween<double>(begin: 0.0, end: 1.0).animate(_controller),
                  color: Theme.of(context).primaryColor,
                  data: widget.data,
                  context: context,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.bottomStartCaption),
                Text(widget.bottomEndCaption),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
