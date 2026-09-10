import 'package:flutter/material.dart';
import '../../teasure_dasbord_widgets/app_progress_bar.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import 'finance_screen_parts.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key, this.onEditPlan});
  final VoidCallback? onEditPlan;

  @override
  Widget build(BuildContext context) => FinancePage(title: 'Budget', children: [
    SoftFinanceCard(
      padding: const EdgeInsets.fromLTRB(26, 28, 26, 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text('Monthly Provision', style: FinanceText.subheading(size: 16))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: const Color(0xFFA8BFA1),
              borderRadius: BorderRadius.circular(16)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.calendar_month_outlined, size: 11, color: screenGreen),
              const SizedBox(width: 4),
              Text('October', style: FinanceText.body(size: 10, color: screenGreen)),
            ]),
          ),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          Text(r'$6,500', style: FinanceText.subheading(size: 16, color: const Color(0xFFD6A326))),
          const SizedBox(width: 24),
          Text('Total Entrusted', style: FinanceText.body(size: 12, color: Colors.black54)),
        ]),
        const SizedBox(height: 28),
        Row(children: [
          Expanded(child: Text(r'$4,250', style: FinanceText.body(size: 12, color: Colors.black54))),
          Text(r'$750', style: FinanceText.subheading(size: 16, weight: FontWeight.w700)),
          const SizedBox(width: 8),
          Text('Remaining', style: FinanceText.body(size: 12, color: Colors.black54)),
        ]),
        const SizedBox(height: 14),
        const AppProgressBar(value: 0.79, height: 7, activeColor: screenGold),
      ]),
    ),
    const SizedBox(height: 22),
    FinanceSection(title: 'Tending Plan', action: 'Edit Plan', onTap: onEditPlan),
    const SizedBox(height: 12),
    const BudgetPlanCard(title: 'First Fruits (Giving)', amount: r'$500 / $500', progress: 1),
    const SizedBox(height: 14),
    const BudgetPlanCard(title: 'Storehouse (Saving)', amount: r'$800 / $1,000', progress: 0.8),
    const SizedBox(height: 14),
    const BudgetPlanCard(title: 'Daily Provision (Living)', amount: r'$2,950 / $3,500', progress: 0.94),
  ]);
}

class BudgetPlanCard extends StatelessWidget {
  const BudgetPlanCard({super.key, required this.title, required this.amount, required this.progress});
  final String title, amount;
  final double progress;

  @override
  Widget build(BuildContext context) => SoftFinanceCard(
    padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
    child: Column(children: [
      Row(children: [
        const FinanceIcon(icon: Icons.card_giftcard_outlined),
        const SizedBox(width: 13),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: FinanceText.subheading(size: 14)),
          const SizedBox(height: 3),
          Text(amount, style: FinanceText.body(size: 12, color: FinanceColors.textDark)),
        ])),
      ]),
      const SizedBox(height: 18),
      AppProgressBar(value: progress, height: 7, activeColor: screenGold),
    ]),
  );
}
