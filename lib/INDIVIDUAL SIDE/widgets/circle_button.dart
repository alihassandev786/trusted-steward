import 'package:flutter/material.dart';

/// Reusable circular icon button widget.
/// Used for the "next" arrow button on onboarding screens,
/// and can be reused anywhere else a round icon button is needed.
class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final Color backgroundColor;
  final Color iconColor;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 52,
    this.backgroundColor = const Color(0xFF306C3F),
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: size * 0.42,
        ),
      ),
    );
  }
}