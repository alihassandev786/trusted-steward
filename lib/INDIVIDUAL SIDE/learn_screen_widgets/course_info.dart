import 'package:flutter/material.dart';
import 'learn_theme.dart';

class CourseInfo extends StatelessWidget {
  const CourseInfo({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: learnIconBackground,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 15,
            color: learnGreen,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: learnText(12),
        ),
      ],
    );
  }
}