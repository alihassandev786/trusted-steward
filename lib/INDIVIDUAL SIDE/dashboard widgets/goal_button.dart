import 'package:flutter/material.dart';
import '../teasure_dasbord_widgets/finance_theme.dart';

class GoalButton extends StatelessWidget {
  const GoalButton({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: FinanceColors.green,
        foregroundColor: Colors.white,
        minimumSize: const Size(0, 46),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: const StadiumBorder(),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: FinanceText.subheading(
          size: 14,
          color: Colors.white,
          weight: FontWeight.w500,
        ),
      ),
    ),
  );
}
