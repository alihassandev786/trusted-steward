import 'package:flutter/material.dart';
import 'app_progress_bar.dart';
import 'finance_theme.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.icon,
    required this.title,
    required this.amount,
    required this.progress,
  });

  final IconData icon;
  final String title;
  final String amount;
  final double progress;

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
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: Color(0xFFC8D9C2),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: Color(0xFF306C3F),
              size: 20,
            ),
          ),

          const SizedBox(width: 13),

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
                  amount,
                  maxLines: 1,
                  style: FinanceText.body(
                    size: 12,
                    color: const Color(0xFF444444),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          AppProgressBar(
            value: progress,
            width: 80,
            height: 7,
            activeColor: FinanceColors.gold,
            inactiveColor: const Color(0xFF8A8A8A),
          ),
        ],
      ),
    );
  }
}