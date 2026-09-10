import 'package:flutter/material.dart';

/// Shared colors & text styles matching the quiz/result design.
class AppColors {
  static const cream = Color(0xFFF9F8F2);      // page background
  static const tile = Color(0xFFF6F2E6);       // option tile background
  static const border = Color(0xFFE9E4D6);
  static const green = Color(0xFF306C3F);
  static const greenDark = Color(0xFF255530);
  static const gold = Color(0xFFD8A73D);
  static const text = Color(0xFF1F1D18);
  static const muted = Color(0xFF6B665A);
  static const track = Color(0xFFE4DFCF);      // progress bar background
  static const radioBorder = Color(0xFFB9B29B);
}

class AppTextStyles {
  static const eyebrow = TextStyle(
    fontFamily: "pop",
    fontSize: 13,
    color: AppColors.green,
    fontWeight: FontWeight.w600,
  );

  static const question = TextStyle(
    fontFamily: "pop",
    fontSize: 28,
    height: 1.3,
    color: AppColors.text,
    fontWeight: FontWeight.w800,
  );

  static const optionText = TextStyle(
    fontFamily: "pop",
    fontSize: 15,
    color: AppColors.text,
    fontWeight: FontWeight.w500,
  );

  static const progressLabel = TextStyle(
    fontFamily: "pop",
    fontSize: 12,
    color: AppColors.muted,
  );

  static const buttonText = TextStyle(
    fontFamily: "pop",
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}

/// Rounded pill button used for "Next" / "Continue".
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const PrimaryButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          disabledBackgroundColor: AppColors.green.withOpacity(0.5),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(label, style: AppTextStyles.buttonText),
      ),
    );
  }
}

/// Thin rounded progress bar with a trailing "x of y" label.
class QuizProgressBar extends StatelessWidget {
  final int current;
  final int total;

  const QuizProgressBar({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    final progress = current / total;
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 7,
              backgroundColor: AppColors.track,
              valueColor: const AlwaysStoppedAnimation(AppColors.gold),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text('$current of $total', style: AppTextStyles.progressLabel),
      ],
    );
  }
}

/// A single tappable answer row with a circular radio indicator.
/// Matches the reference design: flat tan/khaki pill, no border change on
/// selection — only the radio circle fills in with a check.
class QuizOptionTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const QuizOptionTile({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.radioBorder.withOpacity(0.1),
          width: 2),
          color: AppColors.tile,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? AppColors.green : Colors.transparent,
                border: Border.all(
                  color: selected ? AppColors.green : AppColors.radioBorder,
                  width: 2,
                ),
              ),
              child: selected
                  ? const Icon(Icons.check, size: 13, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 14),
            Expanded(child: Text(label, style: AppTextStyles.optionText)),
          ],
        ),
      ),
    );
  }
}