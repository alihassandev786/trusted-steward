import 'package:flutter/material.dart';
import 'learn_theme.dart';

class LearnCard extends StatelessWidget {
  const LearnCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    this.color = learnCream,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}