import 'package:flutter/material.dart';


class GraphPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;
  final List<double> data;
  BuildContext context;

  GraphPainter(
      {required this.animation, this.color = Colors.black, required this.data, required this.context}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {

    double minData = min(data);
    double maxData = max(data);

    List<double> normalizedData = normalize(data);

    double segmentWidth = size.width / data.length - 1;

    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (int i = 0; i < data.length; i++) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH((segmentWidth + 1) * i, size.height, segmentWidth,
                -(size.height * normalizedData[i] * animation.value)),
            const Radius.circular(4),
          ),
          paint);
    }
    paintCaptions(
        canvas, size, maxData.toStringAsFixed(1), minData.toStringAsFixed(1));
  }

  List<double> normalize(List<double> data) {
    double maxData = max(data);
    double minData = min(data);

    List<double> normalizedData = [];

    for (var element in data) {
      normalizedData.add((element - minData) / (maxData - minData));
    }

    return normalizedData;
  }

  double max(List<double> data) => data.reduce((value, element) => value > element ? value : element);

  double min(List<double> data) => data.reduce((value, element) => value < element ? value : element);

  void paintCaptions(Canvas canvas, Size size, String maxValue, String minValue) {
    final maxValueTextPainter = TextPainter(
      text: TextSpan(
          text: maxValue, style: Theme.of(context).textTheme.bodyMedium),
      textDirection: TextDirection.ltr,
    );
    maxValueTextPainter.layout();
    maxValueTextPainter.paint(canvas, const Offset(0, 0));

    final minValuetextPainter = TextPainter(
      text: TextSpan(
          text: minValue, style: Theme.of(context).textTheme.bodyMedium),
      textDirection: TextDirection.ltr,
    );
    minValuetextPainter.layout();
    minValuetextPainter.paint(canvas, Offset(0, size.height - (Theme.of(context).textTheme.bodyMedium!.fontSize ?? 0.0)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
