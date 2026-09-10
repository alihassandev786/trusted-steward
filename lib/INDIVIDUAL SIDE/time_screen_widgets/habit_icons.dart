import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

/// Abstract "praying hands" glyph — a peaked apex with two flaring
/// outer arcs (sleeves) and an inner stem that splits into a V
/// (palms), matching the reference Daily Prayer icon exactly.
class PrayerIcon extends StatelessWidget {
  final double size;
  final Color color;

  const PrayerIcon({super.key, this.size = 22, this.color = AppPalette.green});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _PrayerPainter(color: color),
    );
  }
}

class _PrayerPainter extends CustomPainter {
  final Color color;
  _PrayerPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / 24;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6 * s
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    Offset p(double x, double y) => Offset(x * s, y * s);

    final leftArc = Path()
      ..moveTo(p(12, 4).dx, p(12, 4).dy)
      ..quadraticBezierTo(p(5.5, 7).dx, p(5.5, 7).dy, p(5, 18).dx, p(5, 18).dy);

    final rightArc = Path()
      ..moveTo(p(12, 4).dx, p(12, 4).dy)
      ..quadraticBezierTo(
          p(18.5, 7).dx, p(18.5, 7).dy, p(19, 18).dx, p(19, 18).dy);

    final stem = Path()
      ..moveTo(p(12, 4).dx, p(12, 4).dy)
      ..lineTo(p(12, 13).dx, p(12, 13).dy);

    final vSplit = Path()
      ..moveTo(p(12, 13).dx, p(12, 13).dy)
      ..lineTo(p(9, 18).dx, p(9, 18).dy)
      ..moveTo(p(12, 13).dx, p(12, 13).dy)
      ..lineTo(p(15, 18).dx, p(15, 18).dy);

    canvas.drawPath(leftArc, paint);
    canvas.drawPath(rightArc, paint);
    canvas.drawPath(stem, paint);
    canvas.drawPath(vSplit, paint);
  }

  @override
  bool shouldRepaint(covariant _PrayerPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// "Sun-dim" glyph — a small circle with short dash rays around it
/// and a diagonal strike, matching the reference Midday Movement icon.
class SunDimIcon extends StatelessWidget {
  final double size;
  final Color color;

  const SunDimIcon({super.key, this.size = 22, this.color = AppPalette.green});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _SunDimPainter(color: color),
    );
  }
}

class _SunDimPainter extends CustomPainter {
  final Color color;
  _SunDimPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / 24;
    final center = Offset(12 * s, 12 * s);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6 * s
      ..strokeCap = StrokeCap.round;

    // Core circle.
    canvas.drawCircle(center, 4 * s, paint);

    // 8 short dash rays around the circle.
    for (int i = 0; i < 8; i++) {
      final angle = (i * 45) * math.pi / 180;
      final inner = Offset(
        center.dx + 6 * s * math.cos(angle),
        center.dy + 6 * s * math.sin(angle),
      );
      final outer = Offset(
        center.dx + 8.5 * s * math.cos(angle),
        center.dy + 8.5 * s * math.sin(angle),
      );
      canvas.drawLine(inner, outer, paint);
    }

    // Diagonal strike across the whole glyph.
    canvas.drawLine(
      Offset(6.5 * s, 17.5 * s),
      Offset(17.5 * s, 6.5 * s),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _SunDimPainter oldDelegate) =>
      oldDelegate.color != color;
}