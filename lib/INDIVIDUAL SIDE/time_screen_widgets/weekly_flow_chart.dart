import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

/// "Weekly Flow" card: a real, data-driven line chart (not a static
/// image) with two series — a solid green line with point markers
/// and a dashed gold line — plus gridlines and weekday labels.
///
/// Pass 7 values (Mon..Sun) for each series, already on a 0-100 scale
/// (or any consistent scale — the chart auto-fits min/max).
class WeeklyFlowCard extends StatelessWidget {
  final List<double> primarySeries; // solid green line
  final List<double> secondarySeries; // dashed gold line
  final List<String> dayLabels; // 7 labels, e.g. Mon..Sun
  final String badgeText;

  const WeeklyFlowCard({
    super.key,
    required this.primarySeries,
    required this.secondarySeries,
    required this.dayLabels,
    this.badgeText = 'Past 7 Days',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppPalette.cardFill,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppPalette.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Weekly Flow', style: AppTextStyles.week),
              const Spacer(),
              Text(
                badgeText,
                style: AppTextStyles.subtitle.copyWith(
                  color: AppPalette.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 150,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: _LineChartPainter(
                    primary: primarySeries,
                    secondary: secondarySeries,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < dayLabels.length; i++)
                if (dayLabels[i].isNotEmpty)
                  Text(dayLabels[i], style: AppTextStyles.subtitle),
            ],
          ),
        ],
      ),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  final List<double> primary;
  final List<double> secondary;

  _LineChartPainter({required this.primary, required this.secondary});

  @override
  void paint(Canvas canvas, Size size) {
    const gridLines = 3;
    final gridPaint = Paint()
      ..color = AppPalette.border
      ..strokeWidth = 1;

    for (int i = 0; i <= gridLines; i++) {
      final y = size.height / gridLines * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final all = [...primary, ...secondary];
    final maxVal = all.reduce((a, b) => a > b ? a : b);
    final minVal = all.reduce((a, b) => a < b ? a : b);
    final range = (maxVal - minVal).abs() < 0.0001 ? 1 : (maxVal - minVal);

    // Leave a little headroom so the top marker isn't clipped.
    const topPadding = 10.0;
    const bottomPadding = 6.0;
    final chartHeight = size.height - topPadding - bottomPadding;

    double xFor(int i, int n) => n <= 1 ? 0 : size.width * i / (n - 1);
    double yFor(double v) =>
        topPadding + chartHeight - ((v - minVal) / range) * chartHeight;

    // --- Secondary (dashed gold) line ---
    final dashPaint = Paint()
      ..color = AppPalette.gold
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final secondaryPoints = [
      for (int i = 0; i < secondary.length; i++)
        Offset(xFor(i, secondary.length), yFor(secondary[i]))
    ];
    _drawDashedPolyline(canvas, secondaryPoints, dashPaint);

    // --- Primary (solid green) line ---
    final linePaint = Paint()
      ..color = AppPalette.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final primaryPoints = [
      for (int i = 0; i < primary.length; i++)
        Offset(xFor(i, primary.length), yFor(primary[i]))
    ];

    final linePath = Path();
    for (int i = 0; i < primaryPoints.length; i++) {
      if (i == 0) {
        linePath.moveTo(primaryPoints[i].dx, primaryPoints[i].dy);
      } else {
        linePath.lineTo(primaryPoints[i].dx, primaryPoints[i].dy);
      }
    }
    canvas.drawPath(linePath, linePaint);

    // Point markers: white fill with a green ring.
    final markerFill = Paint()..color = Colors.white;
    final markerRing = Paint()
      ..color = AppPalette.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2;

    for (final p in primaryPoints) {
      canvas.drawCircle(p, 4.5, markerFill);
      canvas.drawCircle(p, 4.5, markerRing);
    }
  }

  void _drawDashedPolyline(Canvas canvas, List<Offset> points, Paint paint) {
    const dashLength = 5.0;
    const gapLength = 4.0;

    for (int i = 0; i < points.length - 1; i++) {
      final start = points[i];
      final end = points[i + 1];
      final segmentLength = (end - start).distance;
      final direction = (end - start) / segmentLength;

      double drawn = 0;
      while (drawn < segmentLength) {
        final double dashEnd =
        (drawn + dashLength) > segmentLength ? segmentLength : drawn + dashLength;
        canvas.drawLine(
          start + direction * drawn,
          start + direction * dashEnd,
          paint,
        );
        drawn += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _LineChartPainter oldDelegate) {
    return oldDelegate.primary != primary || oldDelegate.secondary != secondary;
  }
}