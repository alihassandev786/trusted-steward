import 'package:flutter/material.dart';
import 'finance_theme.dart';

class SummaryHeaderCard extends StatelessWidget {
  const SummaryHeaderCard({
    super.key,
    required this.label,
    required this.amount,
    this.inlineSuffix,
    this.belowContent,
  });

  final String label;
  final String amount;

  // Amount ke saath same line mein text, icon ya Row.
  final Widget? inlineSuffix;

  final Widget? belowContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: belowContent == null ? 110 : 138,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F2E6),
        borderRadius: BorderRadius.circular(29),
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
      child: Stack(
        children: [
          Positioned(
            right: -44,
            bottom: -63,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: const Color(0xFFD6A326).withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(27, 29, 22, 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: FinanceText.subheading(
                    size: 16,
                    color: const Color(0xFF292929),
                    weight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      amount,
                      style: FinanceText.subheading(
                        size: 17,
                        color: const Color(0xFFD6A326),
                        weight: FontWeight.w700,
                      ),
                    ),
                    if (inlineSuffix != null) ...[
                      const SizedBox(width: 7),
                      Flexible(child: inlineSuffix!),
                    ],
                  ],
                ),
                if (belowContent != null) ...[
                  const SizedBox(height: 8),
                  belowContent!,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}