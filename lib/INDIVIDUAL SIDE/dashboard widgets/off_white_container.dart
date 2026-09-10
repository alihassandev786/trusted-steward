import 'package:flutter/material.dart';
import 'app_palette.dart';

/// The off-white "floating card" look used across the dashboard —
/// soft border + subtle box shadow, exactly like the reference design.
class OffWhiteContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;

  const OffWhiteContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppPalette.cream,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: AppPalette.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}
