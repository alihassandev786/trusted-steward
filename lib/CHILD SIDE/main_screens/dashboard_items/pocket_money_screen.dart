import 'package:flutter/material.dart';

import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_card.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';
import '../../../INDIVIDUAL SIDE/teasure_dasbord_widgets/app_progress_bar.dart';
import '../../../INDIVIDUAL SIDE/teasure_dasbord_widgets/detail_screen_header.dart';
import '../../../INDIVIDUAL SIDE/teasure_dasbord_widgets/summary_header_card.dart';

class PocketMoneyScreen extends StatelessWidget {
  const PocketMoneyScreen({super.key});

  Widget _moneyCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    double? progress,
    String? progressLabel,
    String? remainingLabel,
  }) {
    return LearnCard(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 22,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: learnIconBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: learnGreen,
                  size: 21,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: learnText(
                        14,
                        weight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: learnText(12).copyWith(height: 1.35),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(
                  amount,
                  style: learnText(
                    14,
                    color: learnGold,
                    weight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          if (progress != null) ...[
            const SizedBox(height: 20),
            AppProgressBar(
              value: progress,
              height: 7,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    progressLabel ?? '',
                    style: learnText(
                      10,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  remainingLabel ?? '',
                  style: learnText(10, color: learnGreen),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const DetailScreenHeader(title: 'Pocket Money'),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 36, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SummaryHeaderCard(
                      label: 'Little Piggy Bank',
                      amount: r'$4,250',
                      inlineSuffix: Text(
                        'total saved',
                        style: learnText(
                          12,
                          color: Colors.black54,
                        ),
                      ),
                      belowContent: Text(
                        'Available under your joyful stewardship.',
                        style: learnText(10),
                      ),
                    ),

                    const SizedBox(height: 38),

                    Text(
                      'Your Three Jars',
                      style: learnText(
                        16,
                        weight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 36),

                    _moneyCard(
                      icon: Icons.volunteer_activism,
                      title: 'Giving Jar',
                      subtitle: 'Church offering & Sunday school mission.',
                      amount: r'$4.00',
                    ),

                    const SizedBox(height: 12),

                    _moneyCard(
                      icon: Icons.travel_explore,
                      title: 'Savings Jar',
                      subtitle: 'Stargazing Telescope\n(\$32.00 goal)',
                      amount: r'$12.00',
                      progress: 12 / 32,
                      progressLabel: r'$12.00 accumulated',
                      remainingLabel: r'$20.00 left to go',
                    ),

                    const SizedBox(height: 12),

                    _moneyCard(
                      icon: Icons.icecream_outlined,
                      title: 'Spending Jar',
                      subtitle: 'Small joys with Mom & Dad’s blessing',
                      amount: r'$2.50',
                    ),

                    const SizedBox(height: 32),

                    Text(
                      'Recent Ledger',
                      style: learnText(
                        16,
                        weight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 22),

                    _moneyCard(
                      icon: Icons.shopping_cart_outlined,
                      title: 'Weekly Allowance',
                      subtitle: 'Sunday Meeting',
                      amount: r'+$4.00',
                    ),

                    const SizedBox(height: 12),

                    _moneyCard(
                      icon: Icons.volunteer_activism_outlined,
                      title: 'Helped Wash Neighbours',
                      subtitle: 'Saturday Chore reward',
                      amount: r'+$3.00',
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