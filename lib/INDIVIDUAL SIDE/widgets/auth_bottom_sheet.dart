import 'package:flutter/material.dart';

/// The cream, rounded-top card that sits pinned to the bottom of the
/// Forgot Password / Verify Email / Create New Password screens.
/// Has a soft shadow along its top edge (since the rest of its edges
/// are flush with the screen).
class AuthBottomSheet extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const AuthBottomSheet({
    super.key,
    required this.child,
    this.backgroundColor = const Color(0xFFF6F2E6),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, -4), // shadow top par
          ),
        ],
      ),
      child: SafeArea(top: false, child: child),
    );
  }
}