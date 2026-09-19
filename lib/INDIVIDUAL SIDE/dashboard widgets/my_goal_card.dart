import 'package:flutter/material.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';
import 'goal_cover.dart';
import 'goal_models.dart';
import 'goal_style.dart';

class MyGoalCard extends StatelessWidget {
  const MyGoalCard({super.key, required this.goal, required this.onTap});

  final StewardshipGoal goal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Container(
    decoration: goalSurface(),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GoalCover(image: goal.cover),
              Padding(
                padding: const EdgeInsets.fromLTRB(26, 26, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goal.category,
                      style: FinanceText.body(color: const Color(0xFF555555)),
                    ),
                    const SizedBox(height: 6),
                    Text(goal.title, style: FinanceText.subheading(size: 16)),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        goal.progressText,
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
                        value: goal.progress,
                        minHeight: 7,
                        color: FinanceColors.gold,
                        backgroundColor: const Color(0xFF8E8E8E),
                        semanticsLabel: 'Goal progress',
                        semanticsValue:
                            '${(goal.progress * 100).round()} percent',
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined, size: 12),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'Target: ${goalDate(context, goal.dueDate)} (${goal.complete ? 'Complete' : goalTimeLeft(goal.dueDate)})',
                            style: FinanceText.body(
                              size: 10,
                              color: FinanceColors.text,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
