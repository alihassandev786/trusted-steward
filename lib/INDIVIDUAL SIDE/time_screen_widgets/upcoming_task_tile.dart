import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

enum TaskPriority { high, medium, low }

class UpcomingTaskTile extends StatelessWidget {
  final String title;
  final TaskPriority priority;
  final String due;
  final bool checked;
  final ValueChanged<bool>? onChanged;

  const UpcomingTaskTile({
    super.key,
    required this.title,
    required this.priority,
    required this.due,
    this.checked = false,
    this.onChanged,
  });

  Color get _priorityColor {
    switch (priority) {
      case TaskPriority.high:
        return AppPalette.danger;
      case TaskPriority.medium:
        return AppPalette.gold;
      case TaskPriority.low:
        return AppPalette.green;
    }
  }

  String get _priorityLabel {
    switch (priority) {
      case TaskPriority.high:
        return 'High Priority';
      case TaskPriority.medium:
        return 'Medium Priority';
      case TaskPriority.low:
        return 'Low Priority';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppPalette.cardFill,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppPalette.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onChanged?.call(!checked),
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: checked ? AppPalette.green : Colors.transparent,
                border: Border.all(color: AppPalette.green, width: 2),
              ),
              child: checked ? const Icon(Icons.check, size: 14, color: Colors.white) : null,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.title),
                const SizedBox(height: 4),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 12.5,fontFamily:"pop"),
                    children: [
                      TextSpan(
                        text: _priorityLabel,
                        style: TextStyle(color: _priorityColor, fontFamily:"popp",fontWeight: FontWeight.w400),
                      ),
                      TextSpan(text: ' - $due', style: const TextStyle(fontFamily:"popp",color: AppPalette.muted)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
