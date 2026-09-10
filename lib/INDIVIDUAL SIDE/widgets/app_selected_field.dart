import 'package:flutter/material.dart';

/// A tappable "selector" field styled the same as [AppTextField] (same
/// pill shape, fill color, padding, and height) but used for values
/// chosen from a picker/bottom sheet instead of typed directly — e.g.
/// country, gender, timezone, or a date.
class AppSelectField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String? value;
  final VoidCallback? onTap;
  final Color fillColor;

  const AppSelectField({
    super.key,
    required this.hintText,
    required this.icon,
    this.value,
    this.onTap,
    this.fillColor = const Color(0xFFEDE8DC),
  });

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.isNotEmpty;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: double.infinity,
        // Matches AppTextField's contentPadding (horizontal: 20, vertical: 12)
        // exactly, so both fields render at the same height.
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                hasValue ? value! : hintText,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'pop',
                  height: 1.2,
                  color: hasValue
                      ? const Color(0xFF1A1A1A)
                      : const Color(0xFF8A8A8A),
                ),
              ),
            ),
            Icon(icon, color: const Color(0xFF306C3F), size: 20),
          ],
        ),
      ),
    );
  }
}