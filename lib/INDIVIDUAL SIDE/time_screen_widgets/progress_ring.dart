import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

/// Colors sampled directly from the reference "segmented" ring design.
const Color kRingDarkGold = Color(0xFFD1A436);
const Color kRingLightGold = Color(0xFFE8D3A0);

/// Segmented circular ring (alternating dark-gold / light-gold arcs
/// with rounded caps) with the percentage centered inside — matches
/// the reference border style exactly. Used on every habit card.
class ProgressRing extends StatelessWidget {
  final int percent;
  final double size;
  final double strokeWidth;

  const ProgressRing({
    super.key,
    required this.percent,
    this.size = 52,
    this.strokeWidth = 5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _SegmentedRingPainter(strokeWidth: strokeWidth),
          ),
          Text('$percent%', style: AppTextStyles.percent),
        ],
      ),
    );
  }
}

class _SegmentedRingPainter extends CustomPainter {
  final double strokeWidth;
  static const int segmentCount = 8;
  static const double gapDegrees = 4;

  _SegmentedRingPainter({required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final segmentSweep = (360 / segmentCount) - gapDegrees;

    for (int i = 0; i < segmentCount; i++) {
      final isDark = i.isEven;
      final paint = Paint()
        ..color = isDark ? kRingDarkGold : kRingLightGold
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth;

      final startDegrees = i * (360 / segmentCount) - 90 + (gapDegrees / 2);
      canvas.drawArc(
        rect,
        startDegrees * math.pi / 180,
        segmentSweep * math.pi / 180,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _SegmentedRingPainter oldDelegate) => false;
}