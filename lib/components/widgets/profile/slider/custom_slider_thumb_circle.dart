import 'package:flutter/material.dart';

import '../../../presentation/colors.dart';

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final double thumbHeight;
  final int min;
  final int max;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
    required this.thumbHeight,
    this.min = 0,
    this.max = 12,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required Size sizeWithOverflow,
    required double textScaleFactor,
    required double value,
  }) {
    final Canvas canvas = context.canvas;

    final rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: thumbHeight, height: thumbHeight),
      Radius.circular(thumbRadius),
    );

    final paint = Paint()
      ..color = ColorThemes.light.primary //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = TextSpan(
      style: TextStyle(
          fontSize: thumbHeight * .5,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1),
      text: getValue(value),
    );
    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    bool isActive = center.dx <= 48.0;

    if (isActive) {
      // Draw active divisor.
      context.canvas.drawLine(center, Offset(center.dx, center.dy - 20), paint);
      context.canvas.drawLine(center, Offset(center.dx, center.dy + 20), paint);
    } else {
      // Draw inactive divisor.
      context.canvas.drawLine(center, Offset(center.dx, center.dy - 3), paint);
      context.canvas.drawLine(center, Offset(center.dx, center.dy + 3), paint);
    }
    canvas.drawRRect(rRect, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}
