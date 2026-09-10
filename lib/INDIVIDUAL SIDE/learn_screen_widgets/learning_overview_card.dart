import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'learn_card.dart';
import 'learn_theme.dart';
import 'overview_stat_card.dart';

class LearningOverviewCard extends StatelessWidget {
  const LearningOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LearnCard(
      padding: const EdgeInsets.fromLTRB(25, 34, 25, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grow in wisdom through the faithful learning',
            style: learnText(12),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const SegmentedLearningRing(
                size: 72,
                percentage: 65,
              ),
              const SizedBox(width: 20),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OverviewStat(
                      icon: Icons.library_books_outlined,
                      label: '8 Courses Active',
                    ),
                    SizedBox(height: 9),
                    OverviewStat(
                      icon: Icons.task_alt,
                      label: '24 Lessons Done',
                    ),
                    SizedBox(height: 9),
                    OverviewStat(
                      icon: Icons.local_fire_department_outlined,
                      label: 'Weekly Goal: 5/7 Days',
                      color: learnGreen,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SegmentedLearningRing extends StatelessWidget {
  const SegmentedLearningRing({
    super.key,
    this.size = 72,
    this.percentage = 65,
  });

  final double size;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: const _SegmentedRingPainter(),
        child: Center(
          child: Text(
            '$percentage%',
            style: learnText(
              size * 0.21,
              color: const Color(0xFFD2A52D),
              weight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _SegmentedRingPainter extends CustomPainter {
  const _SegmentedRingPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final diameter = math.min(size.width, size.height);
    final strokeWidth = diameter * 0.085;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (diameter - strokeWidth) / 2;
    final rect = Rect.fromCircle(
      center: center,
      radius: radius,
    );

    final trackPaint = Paint()
      ..color = const Color(0xFFE8D6A2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true;

    final segmentPaint = Paint()
      ..color = const Color(0xFFD2A52D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt
      ..isAntiAlias = true;

    canvas.drawCircle(center, radius, trackPaint);

    // Four short golden arcs: top, right, bottom and left.
    const sweepAngle = math.pi / 5.5;

    for (int index = 0; index < 4; index++) {
      final centerAngle = -math.pi / 2 + index * math.pi / 2;

      canvas.drawArc(
        rect,
        centerAngle - sweepAngle / 2,
        sweepAngle,
        false,
        segmentPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _SegmentedRingPainter oldDelegate) {
    return false;
  }
}