import 'package:flutter/material.dart';
import 'package:material_app/widgets/glass_panel.dart';
import 'package:material_app/widgets/painters/graph_painter.dart';

class GlassWeatherGraph extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GlassPanel(
        padding: const EdgeInsets.all(10),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Column(
          children: [
            Text(caption),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: CustomPaint(
                painter: GraphPainter(
                  color: Theme.of(context).primaryColor,
                  data: data,
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
                Text(bottomStartCaption),
                Text(bottomEndCaption),
              ],
            )
          ],
        ),
      ),
    );
  }
}
