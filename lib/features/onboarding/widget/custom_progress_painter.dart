import 'package:flutter/material.dart';

class BorderProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  BorderProgressPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 4.0;
    final radius = (size.width - strokeWidth) / 2;

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // DRAW ARC BASED ON PROGRESS
    double sweepAngle = 2 * 3.1415926535 * progress;

    canvas.drawArc(rect, -90 * 0.0174533, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
