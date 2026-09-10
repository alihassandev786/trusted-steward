import 'package:flutter/material.dart';
import '../main_screens/treasure_dashboard_screen_items/finance_screen_parts.dart';
import 'finance_theme.dart';

class ScriptureCard extends StatelessWidget {
  const ScriptureCard({
    super.key,
    required this.quote,
    required this.reference,
  });

  final String quote;
  final String reference;

  @override
  Widget build(BuildContext context) {
    return SoftFinanceCard(
      color: screenGreen,
      padding: const EdgeInsets.fromLTRB(26, 32, 26, 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.format_quote_rounded,
            color: screenGold,
            size: 30,
          ),
          const SizedBox(height: 14),
          Text(
            quote,
            style: FinanceText.subheading(
              size: 14,
              color: Colors.white,
            ).copyWith(height: 1.35),
          ),
          const SizedBox(height: 17),
          Text(
            reference,
            style: FinanceText.body(
              size: 11,
              color: const Color(0xFFD8E4D5),
            ),
          ),
        ],
      ),
    );
  }
}