import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/treasure_dashboard_screen_items/add_expense_screen.dart';
import '../../teasure_dasbord_widgets/category_tile.dart';
import '../../teasure_dasbord_widgets/detail_screen_header.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import '../../teasure_dasbord_widgets/summary_header_card.dart';
import '../../teasure_dasbord_widgets/transaction_tile.dart';


/// Expenses screen — monthly spending vs budget, category breakdown, and
/// recent transactions.
class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FinanceColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DetailScreenHeader(title: 'Expenses'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    SummaryHeaderCard(
                      label: 'Monthly Spending',
                      amount: '\$4,250',
                      inlineSuffix: Row(
                        children: [
                          Flexible(
                            child: Text('/ \$5,000 budget',maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: FinanceText.body(size: 13),
                                                  ),
                          ),
                        ],
                      )
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                         Get.to(()=>AddExpenseScreen(summaryCard: SummaryHeaderCard(
                             label: 'Pledged Amount',
                             amount: '\$120.00',
                             inlineSuffix: Row(
                               children: [
                                 Flexible(
                                   child: Text('Balance and ready to allocate',maxLines: 1,
                                     overflow: TextOverflow.ellipsis,
                                     style: FinanceText.body(size: 13),
                                   ),
                                 ),
                               ],
                             )
                         ),));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: FinanceColors.darkGreen,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Text(
                          '+ Add Expense',
                          style: FinanceText.subheading(
                            size: 15,
                            color: Colors.white,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Text('Categories', style: FinanceText.heading(size: 17)),
                    const SizedBox(height: 12),
                    const CategoryTile(
                      icon: Icons.home_outlined,
                      title: 'Housing',
                      amount: '\$1,800',
                      progress: 0.85,
                    ),
                    const CategoryTile(
                      icon: Icons.restaurant_outlined,
                      title: 'Food',
                      amount: '\$650',
                      progress: 0.4,
                    ),
                    const CategoryTile(
                      icon: Icons.bolt_outlined,
                      title: 'Utilities',
                      amount: '\$320',
                      progress: 1,
                    ),
                    const SizedBox(height: 10),
                    Text('Recent', style: FinanceText.heading(size: 17)),
                    const SizedBox(height: 12),
                    const TransactionTile(
                      icon: Icons.shopping_cart_outlined,
                      title: 'Whole Foods Market',
                      subtitle: 'Today . Food',
                      amount: '-\$450',
                    ),
                    const TransactionTile(
                      icon: Icons.bolt_outlined,
                      title: 'City Power & Light',
                      subtitle: 'Yesterday . Utilities',
                      amount: '-\$450',
                    ),
                    const TransactionTile(
                      icon: Icons.local_gas_station_outlined,
                      title: 'Chevron Station',
                      subtitle: 'Oct 24 . Transport',
                      amount: '-\$450',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}