import 'package:flutter/material.dart';
import 'learn_theme.dart';

class OverviewStat extends StatelessWidget {
  const OverviewStat({
    super.key,
    required this.icon,
    required this.label,
    this.color = const Color(0xFF6F7068),
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 13, color: color),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            label,
            style: learnText(11, color: color),
          ),
        ),
      ],
    );
  }
}