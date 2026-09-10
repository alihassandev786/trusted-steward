import 'package:flutter/material.dart';

/// Selectable card with an icon (or asset image), title, and description.
/// Used on "Choose Stewardship Priorities" and "Select Your Use" screens.
class ChooseStewardShipCard extends StatelessWidget {
  final IconData? icon;
  final String? assetImage;
  final String title;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  const ChooseStewardShipCard({
    super.key,
    this.icon,
    this.assetImage,
    required this.title,
    required this.description,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        // Reduced from vertical: 20 -> 12 so the tile isn't so tall.
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F2E6),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: selected ? const Color(0xFF306C3F) : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, -4), // shadow top par
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF306C3F).withOpacity(0.16),
                shape: BoxShape.circle,
              ),
              child: assetImage != null
                  ? ClipOval(
                child: Image.asset(
                  assetImage!,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              )
                  : Icon(icon, color: const Color(0xFF306C3F), size: 19),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'pop',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'pop',
                      color: Colors.black,
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