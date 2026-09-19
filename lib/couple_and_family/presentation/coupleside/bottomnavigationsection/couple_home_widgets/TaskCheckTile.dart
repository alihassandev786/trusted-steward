import 'package:flutter/material.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';

/// Row tile used in the "Shared Tasks" section, e.g. "Pay Electricity Bill".
/// Shows an outlined circular checkbox, a title, and an
/// "Assigned: X. Due Y" style subtitle. Tapping the circle toggles done state.
class TaskCheckTile extends StatelessWidget {
  final String title;
  final String assignedTo;
  final String dueLabel;
  final bool isDone;
  final ValueChanged<bool>? onToggle;

  const TaskCheckTile({
    super.key,
    required this.title,
    required this.assignedTo,
    required this.dueLabel,
    this.isDone = false,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.heightPercent(0.018),
        horizontal: AppSize.widthPercent(0.04),
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.height * 0.028),
        boxShadow: AppShadows.boxShadow,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onToggle?.call(!isDone),
            child: Container(
              height: AppSize.widthPercent(0.06),
              width: AppSize.widthPercent(0.06),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDone ? AppColors.primary1 : Colors.transparent,
                border: Border.all(
                  color: AppColors.primary1,
                  width: 1.6,
                ),
              ),
              child: isDone
                  ? Icon(
                      Icons.check,
                      size: AppSize.widthPercent(0.04),
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          SizedBox(width: AppSize.widthPercent(0.035)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "pb",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.widthPercent(0.04),
                    color: AppColors.textcolor1,
                  ),
                ),
                SizedBox(height: AppSize.heightPercent(0.004)),
                Text(
                  "Assigned: $assignedTo. Due $dueLabel",
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.032),
                    color: AppColors.textcolor2,
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
