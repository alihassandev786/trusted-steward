import 'package:flutter/material.dart';
import '../teasure_dasbord_widgets/finance_theme.dart';
import 'goal_models.dart';
import 'goal_style.dart';

class GoalJourneyCard extends StatelessWidget {
  const GoalJourneyCard({super.key, required this.goal});

  final StewardshipGoal goal;

  @override
  Widget build(BuildContext context) => Container(
    decoration: goalSurface(),
    padding: const EdgeInsets.all(26),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your goal Journey',
                    style: FinanceText.body(color: const Color(0xFF555555)),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${(goal.progress * 100).round()}% Complete',
                    style: FinanceText.subheading(size: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: goalSage,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  goal.progressText,
                  style: FinanceText.body(size: 10, color: FinanceColors.green),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: goal.progress,
            minHeight: 7,
            color: FinanceColors.gold,
            backgroundColor: const Color(0xFF8E8E8E),
            semanticsLabel: 'Goal completion',
          ),
        ),
        const SizedBox(height: 26),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _stat('Logged', goal.logged, goal.unit)),
            const SizedBox(width: 14),
            Expanded(child: _stat('Target', goal.target, goal.unit)),
            const SizedBox(width: 14),
            Expanded(child: _stat('Remaining', goal.remaining, 'To Goal')),
          ],
        ),
      ],
    ),
  );

  Widget _stat(String label, int value, String unit) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: goalGoldFill,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: FinanceText.body(size: 10, color: FinanceColors.text),
        ),
        const SizedBox(height: 4),
        Text(
          '$value',
          style: FinanceText.subheading(size: 16, color: FinanceColors.gold),
        ),
        Text(
          unit,
          style: FinanceText.body(size: 10, color: FinanceColors.text),
        ),
      ],
    ),
  );
}
