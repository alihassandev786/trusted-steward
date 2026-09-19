import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/treasure_dashboard_screen_items/new_goals_screen.dart';

import '../../teasure_dasbord_widgets/app_progress_bar.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({
    super.key,
    this.onAddMissionFunds,
    this.onAddEmergencyFunds,
    this.onCreateGoal,
  });

  final VoidCallback? onAddMissionFunds;
  final VoidCallback? onAddEmergencyFunds;
  final VoidCallback? onCreateGoal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FinanceColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: Material(
                          color: FinanceColors.green,
                          shape: const CircleBorder(),
                          child: IconButton(
                            tooltip: 'Back',
                            onPressed: () => Navigator.maybePop(context),
                            icon: const Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Savings Goals',
                          style: FinanceText.heading(size: 21),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 44),
                  SavingsGoalCard(
                    category: 'Mission Trip',
                    title: 'Family Mission Trip',
                    amount: r'$6,500',
                    target: r'$5,000',
                    fundedLabel: '40% Funded',
                    progress: 0.77,
                    onAddFunds: onAddMissionFunds,
                  ),
                  const SizedBox(height: 12),
                  SavingsGoalCard(
                    category: 'Security',
                    title: 'Emergency Fund',
                    amount: r'$8,000',
                    target: r'$10,000',
                    fundedLabel: '80% Funded',
                    progress: 0.77,
                    onAddFunds: onAddEmergencyFunds,
                  ),
                  const SizedBox(height: 12),
                  const SavingsGoalCard(
                    category: 'Security',
                    title: 'Emergency Fund',
                    amount: r'$8,000',
                    target: r'$10,000',
                    fundedLabel: '80% Funded',
                    progress: 0.77,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        minimum: const EdgeInsets.fromLTRB(20, 12, 20, 16),
        child: Center(
          heightFactor: 1,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onCreateGoal ??
                        () {
                      Get.to(() => const NewSavingsGoalScreen());
                    },
                style: ElevatedButton.styleFrom(
                  backgroundColor: FinanceColors.green,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  minimumSize: const Size.fromHeight(46),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 13,
                  ),
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  'Create New Goal',
                  style: FinanceText.subheading(
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SavingsGoalCard extends StatelessWidget {
  const SavingsGoalCard({
    super.key,
    required this.category,
    required this.title,
    required this.amount,
    required this.target,
    required this.fundedLabel,
    required this.progress,
    this.estimate = 'Est. Dec 2026',
    this.onAddFunds,
  });

  final String category;
  final String title;
  final String amount;
  final String target;
  final String fundedLabel;
  final String estimate;
  final double progress;
  final VoidCallback? onAddFunds;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 168),
      padding: const EdgeInsets.fromLTRB(26, 24, 26, 29),
      decoration: FinanceDecorations.card(radius: 30).copyWith(
        border: Border.all(
          color: FinanceColors.navBorder,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: FinanceText.body(
              size: 10,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: FinanceText.subheading(size: 16),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  amount,
                  style: FinanceText.subheading(
                    size: 16,
                    color: FinanceColors.gold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'of  $target',
                style: FinanceText.body(
                  size: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          AppProgressBar(
            value: progress,
            height: 7,
            activeColor: FinanceColors.gold,
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              Expanded(
                child: Text(
                  estimate,
                  style: FinanceText.body(
                    size: 10,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                fundedLabel,
                style: FinanceText.body(
                  size: 10,
                  color: FinanceColors.gold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}