import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

/// Small stat tile: icon circle, a big bold value, and a label below.
/// Used in the 2x2 grid (Tasks / Habits / Prayer / Reading).
class StatCard extends StatelessWidget {
  final Widget icon;
  final String value;
  final String label;

  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
      decoration: BoxDecoration(
        color: AppPalette.cardFill,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppPalette.border),
      ),
      child: Column(
        children: [
          Container(
            height: 44,
            width: 44,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppPalette.iconBg,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          const SizedBox(height: 14),
          Text(
            value,
            style: AppTextStyles.title.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 4),
          Text(label, style: AppTextStyles.subtitle),
        ],
      ),
    );
  }
}