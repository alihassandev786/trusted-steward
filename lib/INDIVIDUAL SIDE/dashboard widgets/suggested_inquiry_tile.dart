import 'package:flutter/material.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/dashboard%20widgets/stewardship_style.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';

class SuggestedInquiryTile extends StatelessWidget {
  const SuggestedInquiryTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Container(
    decoration: stewardshipSurface(radius: 22),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: stewardshipInkGold, size: 16),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: FinanceText.body(color: FinanceColors.text),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
