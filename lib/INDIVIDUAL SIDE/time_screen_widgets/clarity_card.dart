import 'package:flutter/material.dart';

import '../dashboard widgets/app_palette.dart';


/// Full-width green highlight card with a lightbulb badge, a title,
/// a quote/body line, and a soft decorative circle in the corner.
class ClarityCard extends StatelessWidget {
  final String title;
  final String message;

  const ClarityCard({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: AppPalette.green),
        child: Stack(
          children: [
            Positioned(
              right: -30,
              top: -30,
              child: Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.06),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.lightbulb_outline_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: AppTextStyles.title.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  message,
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}