import 'package:flutter/material.dart';
import 'learn_theme.dart';

class LearnButton extends StatelessWidget {
  const LearnButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: learnGreen,
          foregroundColor: Colors.white,
          minimumSize: const Size(0, 45),
          elevation: 0,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: learnText(
            14,
            color: Colors.white,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}