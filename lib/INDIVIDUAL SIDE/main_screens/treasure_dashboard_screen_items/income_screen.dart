import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/treasure_dashboard_screen_items/add_income_screen.dart';
import '../../teasure_dasbord_widgets/category_tile.dart';
import '../../teasure_dasbord_widgets/detail_screen_header.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import '../../teasure_dasbord_widgets/summary_header_card.dart';
import '../../teasure_dasbord_widgets/transaction_tile.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

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
              const DetailScreenHeader(title: 'Income'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    SummaryHeaderCard(
                      label: 'Total Monthly Income',
                      amount: r'$6,500',
                      inlineSuffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.trending_up_rounded,
                            size: 15,
                            color: FinanceColors.textMuted,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              '+5% from last month',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: FinanceText.body(size: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                         Get.to(()=>AddIncomeScreen(summaryCard: SummaryHeaderCard(
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
                          '+ Add Income',
                          style: FinanceText.subheading(
                            size: 15,
                            color: Colors.white,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Text(
                      'Categories',
                      style: FinanceText.heading(size: 17),
                    ),
                    const SizedBox(height: 12),
                    const CategoryTile(
                      icon: Icons.work_outline_rounded,
                      title: 'Salary',
                      amount: r'$5,000',
                      progress: 0.85,
                    ),
                    const CategoryTile(
                      icon: Icons.design_services_outlined,
                      title: 'Freelance',
                      amount: r'$1,200',
                      progress: 0.4,
                    ),
                    const CategoryTile(
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Other Income',
                      amount: r'$320',
                      progress: 1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Recent Deposits',
                      style: FinanceText.heading(size: 17),
                    ),
                    const SizedBox(height: 12),
                    const TransactionTile(
                      icon: Icons.apartment_rounded,
                      title: 'TechCorp Inc.',
                      subtitle: 'Oct 15. Direct Deposit',
                      amount: r'+$450',
                    ),
                    const TransactionTile(
                      icon: Icons.person_outline_rounded,
                      title: 'Sarah Jenkins',
                      subtitle: 'Oct 12. Venmo Transfer',
                      amount: r'+$450',
                    ),
                    const TransactionTile(
                      icon: Icons.savings_outlined,
                      title: 'Yield Interest',
                      subtitle: 'Oct 24 . High Yield Savings',
                      amount: r'+$12',
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