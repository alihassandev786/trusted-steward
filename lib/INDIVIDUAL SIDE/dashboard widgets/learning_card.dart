import 'package:flutter/material.dart';
import 'app_palette.dart';
import 'off_white_container.dart';

class LearningCard extends StatelessWidget {
  final String imageAsset;
  final String moduleLabel;
  final String title;
  final double progress;
  final VoidCallback onTap;

  const LearningCard({
    super.key,
    required this.imageAsset,
    required this.moduleLabel,
    required this.title,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OffWhiteContainer(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.asset(
                  imageAsset,
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 170,
                    color: AppPalette.iconBg,
                    alignment: Alignment.center,
                    child: const Icon(Icons.menu_book_rounded, size: 40, color: AppPalette.green),
                  ),
                ),
              ),
              Positioned(
                right: 14,
                bottom: 14,
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.green),
                    child: const Icon(Icons.north_east_rounded, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(moduleLabel, style: AppTextStyles.subtitle),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16,fontFamily: "pop", fontWeight: FontWeight.w800, color: AppPalette.text),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
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
                    const SizedBox(width: 10),
                    Text(
                      '${(progress * 100).round()}%',
                      style: const TextStyle(fontSize: 12,fontFamily: "pop", fontWeight: FontWeight.w700, color: AppPalette.muted),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
