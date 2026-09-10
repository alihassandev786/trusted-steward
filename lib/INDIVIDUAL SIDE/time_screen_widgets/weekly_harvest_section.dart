import 'package:flutter/material.dart';

import '../dashboard widgets/app_palette.dart';

class WeeklyHarvestSection extends StatelessWidget {
  final int completedTasks;
  final double progress;
  final String caption;

  const WeeklyHarvestSection({
    super.key,
    required this.completedTasks,
    required this.progress,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Weekly Harvest',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800,fontFamily:"popp", color: AppPalette.text),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              '$completedTasks',
              style: const TextStyle(fontSize: 30,fontFamily:"popp", fontWeight: FontWeight.w800, color: AppPalette.gold),
            ),
            const SizedBox(width: 6),
            const Text(
              'tasks ended',
              style: TextStyle(fontSize: 14, color: AppPalette.muted,fontFamily:"popp", fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: 14),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: AppPalette.text.withOpacity(0.4),
            valueColor: const AlwaysStoppedAnimation(AppPalette.gold),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          caption,
          style: const TextStyle(fontSize: 12.5,fontFamily:"popp", color: AppPalette.muted),
        ),
      ],
    );
  }
}
