import 'package:flutter/material.dart';
import 'learn_card.dart';
import 'learn_theme.dart';

enum LessonStatus {
  completed,
  current,
  locked,
}

class CourseLessonTile extends StatelessWidget {
  const CourseLessonTile({
    super.key,
    required this.number,
    required this.title,
    required this.status,
    this.onTap,
  });

  final int number;
  final String title;
  final LessonStatus status;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final current = status == LessonStatus.current;
    final locked = status == LessonStatus.locked;

    final foreground = current
        ? Colors.white
        : locked
        ? const Color(0xFF888984)
        : const Color(0xFF252525);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: locked ? null : onTap,
        child: LearnCard(
          color: current
              ? learnGreen
              : locked
              ? const Color(0xFFCDCEC9)
              : learnCream,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 21,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: current
                      ? const Color(0xFF205B35)
                      : locked
                      ? const Color(0xFFB7B9B4)
                      : learnIconBackground,
                ),
                child: Icon(
                  current
                      ? Icons.play_arrow_outlined
                      : locked
                      ? Icons.lock_outline
                      : Icons.check_circle,
                  size: 19,
                  color: current
                      ? Colors.white
                      : locked
                      ? const Color(0xFF969A94)
                      : learnGreen,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lesson $number',
                      style: learnText(
                        14,
                        color: foreground,
                        weight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: learnText(12, color: foreground),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}