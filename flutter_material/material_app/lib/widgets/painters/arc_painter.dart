import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:material_app/entities/astronomic_data.dart';

class ArcPainter extends CustomPainter {
  final Color arcColor;
  final AstronomicData data;
  BuildContext context;

  ArcPainter(
      {this.arcColor = Colors.black,
      required this.data,
      required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    drawSkyline(canvas, size);
    drawSun(canvas, size);
  }

  void drawSkyline(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
        center: size.bottomCenter(Offset.zero), radius: size.width / 2);
    const startAngle = -math.pi;
    const sweepAngle = math.pi;
    final arcPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = arcColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    canvas.drawArc(rect, startAngle, sweepAngle, false, arcPaint);
  }

  void drawSun(Canvas canvas, Size size) {
    final sunPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    const sunRadius = 30.0;
    final sinceSunrise = DateTime(
            data.sunrise.year,
            data.sunrise.month,
            data.sunrise.day,
            DateTime.now().hour,
            DateTime.now().minute,
            DateTime.now().second)
        .difference(data.sunrise);
    final tillSunset = data.sunset.difference(DateTime(
        data.sunrise.year,
        data.sunrise.month,
        data.sunrise.day,
        DateTime.now().hour,
        DateTime.now().minute,
        DateTime.now().second));

    if (sinceSunrise.inSeconds > 0 && tillSunset.inSeconds > 0) {
      final sunUpDuration = data.sunset.difference(data.sunrise);
      final sunRelativePosX =
          sinceSunrise.inSeconds / sunUpDuration.inSeconds.abs();
      final xOffset = size.width * sunRelativePosX;
      final yOffset = size.height -
          math.sqrt(math.pow(size.width / 2, 2) -
              math.pow(size.width / 2 - xOffset, 2));

      canvas.drawCircle(Offset(xOffset, yOffset), sunRadius, sunPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
