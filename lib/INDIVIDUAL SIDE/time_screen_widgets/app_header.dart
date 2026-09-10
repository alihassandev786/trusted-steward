import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

/// Reusable screen header: green circular back button + bold title.
/// Used across TimeTracking, NewTask and DailyRhythms screens.
class AppHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final Widget? trailing;

  const AppHeader({
    super.key,
    required this.title,
    this.onBack,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onBack ?? () => Navigator.maybePop(context),
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: AppPalette.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.heading,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
