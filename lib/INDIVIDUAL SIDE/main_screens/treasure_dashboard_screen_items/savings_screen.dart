import 'package:flutter/material.dart';
import '../../teasure_dasbord_widgets/app_progress_bar.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import 'finance_screen_parts.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({super.key, this.onAddMissionFunds,
    this.onAddEmergencyFunds, this.onCreateGoal});
  final VoidCallback? onAddMissionFunds;
  final VoidCallback? onAddEmergencyFunds;
  final VoidCallback? onCreateGoal;

  @override
  Widget build(BuildContext context) => FinancePage(
    title: 'Savings Goals',
    children: [
      SavingsGoalCard(category: 'Mission Trip', title: 'Family Mission Trip',
        amount: r'$6,500', target: r'$5,000', fundedLabel: '40% Funded',
        progress: 0.77, onAddFunds: onAddMissionFunds),
      const SizedBox(height: 14),
      SavingsGoalCard(category: 'Security', title: 'Emergency Fund',
        amount: r'$8,000', target: r'$10,000', fundedLabel: '80% Funded',
        progress: 0.77, onAddFunds: onAddEmergencyFunds),
      const SizedBox(height: 62),
      FinanceAction(label: 'Create New Goal', onPressed: onCreateGoal),
    ],
  );
}

class SavingsGoalCard extends StatelessWidget {
  const SavingsGoalCard({super.key, required this.category, required this.title,
    required this.amount, required this.target, required this.fundedLabel,
    required this.progress, this.estimate = 'Est. Dec 2026', this.onAddFunds});
  final String category, title, amount, target, fundedLabel, estimate;
  final double progress;
  final VoidCallback? onAddFunds;

  @override
  Widget build(BuildContext context) => SoftFinanceCard(
    padding: const EdgeInsets.fromLTRB(18, 24, 18, 30),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(category, style: FinanceText.body(size: 10, color: Colors.black54)),
          const SizedBox(height: 4),
          Text(title, style: FinanceText.subheading(size: 16)),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: Text(amount, style: FinanceText.subheading(
              size: 16, color: const Color(0xFFD6A326)))),
            Text('of  $target', style: FinanceText.body(size: 12, color: Colors.black54)),
          ]),
          const SizedBox(height: 4),
          AppProgressBar(value: progress, height: 7, activeColor: screenGold),
          const SizedBox(height: 9),
          Row(children: [
            Expanded(child: Text(estimate, style: FinanceText.body(size: 10, color: Colors.black54))),
            Text(fundedLabel, style: FinanceText.body(size: 10, color: const Color(0xFFD6A326))),
          ]),
        ]),
      ),
      const SizedBox(height: 34),
      FinanceAction(label: 'Add Funds', onPressed: onAddFunds),
    ]),
  );
}
