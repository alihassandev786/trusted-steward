import 'package:flutter/material.dart';
import '../main_screens/treasure_dashboard_screen_items/finance_screen_parts.dart';
import 'app_progress_bar.dart';
import 'finance_theme.dart';

class ProvisionSummaryCard extends StatelessWidget {
  const ProvisionSummaryCard({
    super.key,
    required this.provision,
    required this.stewardship,
    required this.progress,
    required this.allocatedLabel,
    required this.remainingLabel,
  });

  final String provision;
  final String stewardship;
  final double progress;
  final String allocatedLabel;
  final String remainingLabel;

  @override
  Widget build(BuildContext context) {
    return SoftFinanceCard(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 24),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Provision',
                      style: FinanceText.subheading(size: 14),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      provision,
                      style: FinanceText.body(
                        size: 12,
                        color: FinanceColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Stewardship',
                      style: FinanceText.subheading(size: 14),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      stewardship,
                      style: FinanceText.body(
                        size: 12,
                        color: FinanceColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          AppProgressBar(
            value: progress,
            height: 7,
            activeColor: screenGold,
            inactiveColor: const Color(0xFF8A8A8A),
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              Expanded(
                child: Text(
                  allocatedLabel,
                  style: FinanceText.body(
                    size: 10,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  remainingLabel,
                  textAlign: TextAlign.right,
                  style: FinanceText.body(
                    size: 10,
                    color: const Color(0xFFD6A326),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}