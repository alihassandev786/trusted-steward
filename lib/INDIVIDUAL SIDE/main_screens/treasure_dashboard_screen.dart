import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/treasure_dashboard_screen_items/budget_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/treasure_dashboard_screen_items/expense_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/treasure_dashboard_screen_items/giving_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/treasure_dashboard_screen_items/income_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/treasure_dashboard_screen_items/report_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/treasure_dashboard_screen_items/savings_screen.dart';
import '../teasure_dasbord_widgets/budget_progress_card.dart';
import '../teasure_dasbord_widgets/finance_theme.dart';
import '../teasure_dasbord_widgets/monthly_provision_card.dart';
import '../teasure_dasbord_widgets/quick_action_button.dart';
import '../teasure_dasbord_widgets/transaction_tile.dart';


/// Treasure Dashboard — the finance section's home screen: monthly
/// provision summary, quick actions, budget/goal progress, and recent
/// activity.
class TreasureDashboardScreen extends StatefulWidget {
  const TreasureDashboardScreen({super.key});

  @override
  State<TreasureDashboardScreen> createState() => _TreasureDashboardScreenState();
}

class _TreasureDashboardScreenState extends State<TreasureDashboardScreen> {
  int _navIndex = 2; // Treasure tab active by default

  void _openIncome() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const IncomeScreen()));
  }

  void _openExpenses() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const ExpensesScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FinanceColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Treasure Dashboard', style: FinanceText.heading(size: 22)),
              const SizedBox(height: 16),
              const MonthlyProvisionCard(
                totalIncome: '\$6,500',
                totalExpenses: '\$4,250',
                faithfulGiving: '\$850',
                givingProgress: 0.17,
                currentSavings: '\$1,400',
              ),
              const SizedBox(height: 18),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5,
                children: [
                  QuickActionButton(
                    icon: Icons.call_received_rounded,
                    label: 'Incoming',
                    onTap: _openIncome,
                  ),
                  QuickActionButton(
                    icon: Icons.call_made_rounded,
                    label: 'Expenses',
                    onTap: _openExpenses,
                  ),
                  QuickActionButton(
                    icon: Icons.pie_chart_outline_rounded,
                    label: 'Budget',
                    onTap: () {
                      Get.to(()=>BudgetScreen());
                    },
                  ),
                  QuickActionButton(
                    icon: Icons.savings_outlined,
                    label: 'Savings',
                    onTap: () {
                      Get.to(()=>SavingsScreen());
                    },
                  ),
                  QuickActionButton(
                    icon: Icons.favorite,
                    label: 'Giving',
                    onTap: () {
                      Get.to(()=>GivingScreen());
                    },
                  ),
                  QuickActionButton(
                    icon: Icons.list_alt_rounded,
                    label: 'Activity',
                    onTap: () {
                      Get.to(()=>ReportsScreen());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 18),
              BudgetProgressCard(
                title: 'Monthly Budget',
                trailingLabel: '\$2,350 of \$5,000',
                progress: 2350 / 5000,
              ),
              BudgetProgressCard(
                title: 'Family Mission Trip',
                trailingLabel: '40% (\$2,000 of \$5,000)',
                subtitle: 'Saving goals',
                progress: 0.4,
              ),
              const SizedBox(height: 10),
              Text('Recent Activity', style: FinanceText.heading(size: 17)),
              const SizedBox(height: 12),
              const TransactionTile(
                icon: Icons.access_time_rounded,
                title: 'Local Church Tithe',
                subtitle: 'Today',
                amount: '-\$450',
              ),
              const TransactionTile(
                icon: Icons.shopping_cart_outlined,
                title: 'Whole Fods Market',
                subtitle: 'Yesterday',
                amount: '-\$182.4',
              ),
              const TransactionTile(
                icon: Icons.receipt_long_outlined,
                title: 'City Utilities',
                subtitle: 'October 12',
                amount: '-\$95.2',
              ),
            ],
          ),
        ),
      ),

    );
  }
}