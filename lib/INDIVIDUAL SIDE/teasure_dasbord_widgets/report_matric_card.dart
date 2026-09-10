import 'package:flutter/material.dart';
import '../main_screens/treasure_dashboard_screen_items/finance_screen_parts.dart';
import 'finance_theme.dart';

class ReportMetricCard extends StatelessWidget {
  const ReportMetricCard({
    super.key,
    required this.icon,
    required this.title,
    required this.amount,
    required this.subtitle,
    this.golden = false,
  });

  final IconData icon;
  final String title;
  final String amount;
  final String subtitle;
  final bool golden;

  @override
  Widget build(BuildContext context) {
    final foreground = golden ? Colors.white : FinanceColors.textDark;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 138),
      padding: const EdgeInsets.fromLTRB(21, 22, 16, 20),
      decoration: BoxDecoration(
        color: golden ? screenGold : FinanceColors.card,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.09),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: golden
                  ? const Color(0xFFE9CF7C)
                  : const Color(0xFFBDCEB6),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 14,
              color: golden ? screenGold : screenGreen,
            ),
          ),
          const SizedBox(height: 11),
          Text(
            title,
            style: FinanceText.body(
              size: 9,
              color: foreground,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            amount,
            style: FinanceText.subheading(
              size: 16,
              color: foreground,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            subtitle,
            style: FinanceText.body(
              size: 10,
              color: golden
                  ? const Color(0xFF80651F)
                  : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}