import 'package:flutter/material.dart';
import '../main_screens/treasure_dashboard_screen_items/finance_screen_parts.dart';
import 'finance_theme.dart';

class SpendingRhythmCard extends StatelessWidget {
  const SpendingRhythmCard({
    super.key,
    this.onOptions,
  });

  final VoidCallback? onOptions;

  @override
  Widget build(BuildContext context) {
    return SoftFinanceCard(
      padding: const EdgeInsets.fromLTRB(23, 24, 23, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Spending Rhythm',
                  style: FinanceText.subheading(size: 16),
                ),
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: Material(
                  color: screenGreen,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: onOptions,
                    child: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          const SizedBox(
            width: double.infinity,
            height: 160,
            child: CustomPaint(
              painter: _WeeklyGridPainter(),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _WeekLabel('W1'),
                      _WeekLabel('W2'),
                      _WeekLabel('W3', selected: true),
                      _WeekLabel('W4'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          const Wrap(
            spacing: 30,
            runSpacing: 8,
            children: [
              _LegendItem(label: 'Actual', color: screenGreen),
              _LegendItem(label: 'Expected', color: screenGold),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeekLabel extends StatelessWidget {
  const _WeekLabel(this.label, {this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        label,
        style: FinanceText.body(
          size: 9,
          color: selected
              ? const Color(0xFF003D2D)
              : Colors.black54,
          weight: selected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: FinanceText.body(
            size: 12,
            color: FinanceColors.textDark,
          ),
        ),
      ],
    );
  }
}

class _WeeklyGridPainter extends CustomPainter {
  const _WeeklyGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFDDD2B3)
      ..strokeWidth = 1;

    for (int index = 0; index < 4; index++) {
      final y = 0.5 + (size.height - 1) * index / 3;

      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WeeklyGridPainter oldDelegate) => false;
}