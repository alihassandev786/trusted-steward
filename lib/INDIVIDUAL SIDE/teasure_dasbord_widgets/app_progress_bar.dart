import 'package:flutter/material.dart';
import 'finance_theme.dart';

/// Rounded progress bar with a gold active section
/// and grey inactive section.
class AppProgressBar extends StatelessWidget {
  const AppProgressBar({
    super.key,
    required this.value,
    this.height = 6,
    this.width,
    this.activeColor = FinanceColors.gold,
    this.inactiveColor = const Color(0xFF8A8A8A),
  });

  /// Progress between 0.0 and 1.0.
  final double value;

  /// Height of the progress bar.
  final double height;

  /// If null, progress bar takes the available width.
  final double? width;

  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final double progress = value.clamp(0.0, 1.0);

    final Widget progressBar = ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: double.infinity,
            height: height,
            color: inactiveColor,
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: progress,
              heightFactor: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(height),
                ),
              ),
            ),
          );
        },
      ),
    );

    if (width != null) {
      return SizedBox(
        width: width,
        height: height,
        child: progressBar,
      );
    }

    return SizedBox(
      width: double.infinity,
      height: height,
      child: progressBar,
    );
  }
}