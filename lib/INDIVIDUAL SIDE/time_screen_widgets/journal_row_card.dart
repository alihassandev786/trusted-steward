import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

class JournalRowCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const JournalRowCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: AppPalette.cardFill,
          borderRadius: BorderRadius.circular(30),
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
              child: const Icon(Icons.access_time_rounded, size: 19, color: AppPalette.green),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 14.5,fontFamily:"popp", fontWeight: FontWeight.w700, color: AppPalette.text)),
                  const SizedBox(height: 3),
                  Text(subtitle, style: const TextStyle(fontSize: 12,fontFamily:"popp", color: AppPalette.muted)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppPalette.muted),
          ],
        ),
      ),
    );
  }
}
