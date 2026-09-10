import 'package:flutter/material.dart';

/// Generic pill badge — used for "In Progress", "High Priority", "Spiritual" tags.
class PillBadge extends StatelessWidget {
  final IconData? icon;
  final String label;
  final Color background;
  final Color foreground;

  const PillBadge({
    super.key,
    this.icon,
    required this.label,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: foreground),
            const SizedBox(width: 5),
          ],
          Text(
            label,
            style: TextStyle(fontSize: 12, fontFamily:"pop",fontWeight: FontWeight.w700, color: foreground),
          ),
        ],
      ),
    );
  }
}
