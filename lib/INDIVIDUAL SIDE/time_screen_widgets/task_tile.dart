import 'package:flutter/material.dart';

import '../dashboard widgets/app_palette.dart';


/// Agenda row: a rounded time badge on the left, title + subtitle on
/// the right. Used under the calendar in the Time Tracking screen.
class TaskTile extends StatelessWidget {
  final String time; // e.g. "09:00\nAm"
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const TaskTile({
    super.key,
    required this.time,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppPalette.tileFill,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 48,
              width: 48,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppPalette.iconBg,
                shape: BoxShape.circle,
              ),
              child: Text(
                time,
                textAlign: TextAlign.center,
                style: AppTextStyles.timetrack.copyWith(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.title),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTextStyles.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
