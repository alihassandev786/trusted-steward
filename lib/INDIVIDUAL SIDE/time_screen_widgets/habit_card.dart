import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';
import 'progress_ring.dart';

/// Sampled directly from the reference design — the muted sage-green
/// used for the icon circle background and the unfilled streak dots.
const Color kHabitSage = Color(0xFFBBCAB4);

/// Card for a single daily habit: icon, title/subtitle, a "done today"
/// checkmark badge, a row of streak dots, and a percentage ring.
class HabitCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final bool completedToday;
  final int streakDays;
  final int totalDots;
  final int filledDots;
  final int percent;
  final VoidCallback? onToggle;
  final VoidCallback? onTap;

  const HabitCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.streakDays,
    required this.totalDots,
    required this.filledDots,
    required this.percent,
    this.completedToday = false,
    this.onToggle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppPalette.cardFill,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: kHabitSage,
                    shape: BoxShape.circle,
                  ),
                  child: icon,
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
                GestureDetector(
                  onTap: onToggle,
                  child: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      color: completedToday ? AppPalette.green : AppPalette.track,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$streakDays Day Streak', style: AppTextStyles.subtitle),
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(totalDots, (i) {
                          final filled = i < filledDots;
                          return Container(
                            margin: const EdgeInsets.only(right: 5),
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: filled ? AppPalette.green : kHabitSage,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                ProgressRing(percent: percent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}