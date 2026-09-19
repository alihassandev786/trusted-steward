import 'package:flutter/material.dart';
import '../teasure_dasbord_widgets/finance_theme.dart';
import 'goal_models.dart';
import 'goal_style.dart';

class GoalConnectionTile extends StatelessWidget {
  const GoalConnectionTile({super.key, required this.connection});

  final GoalConnection connection;

  @override
  Widget build(BuildContext context) => Container(
    decoration: goalSurface(),
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: goalSage,
          child: Icon(
            connection.complete ? Icons.check_circle : Icons.circle_outlined,
            size: 18,
            color: FinanceColors.green,
          ),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(connection.title, style: FinanceText.subheading(size: 14)),
              const SizedBox(height: 4),
              Text(
                connection.subtitle,
                style: FinanceText.body(size: 12, color: FinanceColors.text),
              ),
            ],
          ),
        ),
        if (!connection.complete)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: goalGoldFill,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Upcoming',
                style: FinanceText.body(size: 10, color: FinanceColors.gold),
              ),
            ),
          ),
      ],
    ),
  );
}
