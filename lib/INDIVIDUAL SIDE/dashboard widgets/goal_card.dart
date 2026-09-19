import 'package:flutter/material.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/dashboard%20widgets/talent_style.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    super.key,
    required this.imagePath,
    this.completed = 7,
    this.total = 10,
  });

  final String imagePath;
  final int completed;
  final int total;

  @override
  Widget build(BuildContext context) => Container(
    decoration: talentSurface(),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            height: 198,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              height: 198,
              color: FinanceColors.iconBg,
              child: const Center(
                child: Icon(
                  Icons.photo_outlined,
                  size: 44,
                  color: FinanceColors.green,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Faith & Wisdom',
                  style: FinanceText.body(color: const Color(0xFF555555)),
                ),
                const SizedBox(height: 6),
                Text(
                  'Read 10 Proverbs with Dad',
                  style: FinanceText.subheading(size: 16),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '$completed of $total read',
                    style: FinanceText.body(
                      size: 12,
                      color: const Color(0xFF555555),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    minHeight: 7,
                    value: total > 0
                        ? (completed / total).clamp(0.0, 1.0).toDouble()
                        : 0,
                    backgroundColor: const Color(0xFF8E8E8E),
                    color: FinanceColors.gold,
                    semanticsLabel: 'Reading goal progress',
                    semanticsValue: '$completed of $total',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
