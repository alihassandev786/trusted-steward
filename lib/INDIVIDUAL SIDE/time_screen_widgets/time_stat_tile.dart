import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

class TimeStatTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double progress;

  const TimeStatTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppPalette.cardFill,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppPalette.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.iconBg),
            child: Icon(icon, size: 19, color: AppPalette.green),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.title),
                const SizedBox(height: 3),
                Text(subtitle, style: AppTextStyles.subtitle),
              ],
            ),
          ),
          SizedBox(
            width: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: AppPalette.track,
                valueColor: const AlwaysStoppedAnimation(AppPalette.gold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
