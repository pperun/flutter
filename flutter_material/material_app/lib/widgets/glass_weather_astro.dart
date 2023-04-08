import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_app/entities/astronomic_data.dart';
import 'package:material_app/widgets/painters/arc_painter.dart';

import 'glass_panel.dart';

class GlassWeatherAstro extends StatelessWidget {
  final AstronomicData astro;

  const GlassWeatherAstro({super.key, required this.astro});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomPaint(
                size: const Size(320, 200),
                painter: ArcPainter(
                  arcColor: Theme.of(context).primaryColor,
                  data: astro,
                  context: context,
                ),
              ),
              Text(
                DateFormat.Hm().format(DateTime.now()),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/sun.png'),
                  ),
                  Text('${DateFormat.Hm().format(astro.sunrise)} - '
                      '${DateFormat.Hm().format(astro.sunset)}'),
                ],
              ),
              Row(
                children: [
                  Text('${astro.moonrise == null ? 'No moonrise' :  DateFormat.Hm().format(astro.moonrise!)} - '
                      '${astro.moonset == null ? 'No moonrise' :  DateFormat.Hm().format(astro.moonset!)}'),
                  const Image(
                    image: AssetImage('assets/moon.png'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
