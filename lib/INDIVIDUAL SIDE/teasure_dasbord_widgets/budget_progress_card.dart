import 'package:flutter/material.dart';
import 'app_progress_bar.dart';
import 'finance_theme.dart';

class BudgetProgressCard extends StatelessWidget {
  const BudgetProgressCard({
    super.key,
    required this.title,
    required this.trailingLabel,
    required this.progress,
    this.subtitle,
  });

  final String title;
  final String trailingLabel;
  final double progress;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: EdgeInsets.fromLTRB(
        30,
        22,
        25,
        subtitle == null ? 27 : 24,
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FinanceText.subheading(
                    size: 14,
                    color: const Color(0xFF292929),
                    weight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                trailingLabel,
                style: FinanceText.body(
                  size: 11,
                  color: const Color(0xFF777777),
                  weight: FontWeight.w400,
                ),
              ),
            ],
          ),

          if (subtitle != null) ...[
            const SizedBox(height: 3),
            Text(
              subtitle!,
              style: FinanceText.body(
                size: 12,
                color: const Color(0xFF555555),
              ),
            ),
          ],

          SizedBox(height: subtitle == null ? 17 : 14),

          AppProgressBar(
            value: progress.clamp(0.0, 1.0),
            height: 7,
          ),
        ],
      ),
    );
  }
}