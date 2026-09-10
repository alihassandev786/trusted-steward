import 'package:flutter/material.dart';
import 'learn_card.dart';
import 'learn_theme.dart';

class LearnListTile extends StatelessWidget {
  const LearnListTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailingLabel,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final String? trailingLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: LearnCard(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
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
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: learnText(13, weight: FontWeight.w600),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 3),
                      Text(subtitle!, style: learnText(11)),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (trailingLabel != null)
                Text(
                  trailingLabel!,
                  style: learnText(
                    10,
                    color: learnGreen,
                    weight: FontWeight.w600,
                  ),
                )
              else
                const Icon(
                  Icons.chevron_right,
                  color: learnGreen,
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}