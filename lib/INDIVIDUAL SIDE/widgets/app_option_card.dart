import 'package:flutter/material.dart';

/// Reusable selectable card widget
class AppOptionCard extends StatelessWidget {
  final IconData? icon;
  final String? assetImage;
  final String title;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  const AppOptionCard({
    super.key,
    this.icon,
    this.assetImage,
    required this.title,
    required this.description,
    required this.selected,
    required this.onTap,
  }) : assert(
  icon != null || assetImage != null,
  'Icon ya assetImage dena zaroori hai.',
  );

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.13,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F1E4),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: selected
                ? const Color(0xFF306C3F)
                : const Color(0xFFE3DDCC),
            width: selected ? 2.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              padding: assetImage != null
                  ? const EdgeInsets.all(8)
                  : EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Color(0xFFCFE0CB),
                shape: BoxShape.circle,
              ),
              child: assetImage != null
                  ? Image.asset(
                assetImage!,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.broken_image_outlined,
                  color: Color(0xFF306C3F),
                  size: 22,
                ),
              )
                  : Icon(
                icon,
                color: const Color(0xFF306C3F),
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'pop',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'pop',
                      color: Colors.black,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                    ),
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