import 'package:flutter/material.dart';
import 'finance_theme.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 88,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 21),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F2E6),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.10),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration:  BoxDecoration(
              color: Color(0xFF306C3F).withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: Color(0xFF306C3F),
              size: 20,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FinanceText.subheading(
                    size: 14,
                    color: const Color(0xFF292929),
                    weight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FinanceText.body(
                    size: 12,
                    color: const Color(0xFF505050),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Text(
            amount,
            style: FinanceText.subheading(
              size: 14,
              color: const Color(0xFF292929),
              weight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}