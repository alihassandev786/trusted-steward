import 'package:flutter/material.dart';
import 'finance_theme.dart';

/// Back-button + bold title header used on Income/Expenses (and any other
/// "detail" screen pushed from the Treasure Dashboard).
class DetailScreenHeader extends StatelessWidget {
  const DetailScreenHeader({
    super.key,
    required this.title,
    this.onBackTap,
  });

  final String title;
  final VoidCallback? onBackTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBackTap ?? () => Navigator.maybePop(context),
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: FinanceColors.darkGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chevron_left_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Text(title, style: FinanceText.heading(size: 22)),
        ],
      ),
    );
  }
}
