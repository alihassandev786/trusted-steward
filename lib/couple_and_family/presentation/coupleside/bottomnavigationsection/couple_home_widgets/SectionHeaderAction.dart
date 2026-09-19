import 'package:flutter/material.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';


/// Reusable section title row with an optional trailing circular "+" button.
/// Used for headings like "Shared Goals" and "Shared Tasks" where the user
/// can tap "+" to add a new goal/task.
class SectionHeaderAction extends StatelessWidget {
  final String title;
  final VoidCallback? onAddTap;
  final bool showAddButton;

  const SectionHeaderAction({
    super.key,
    required this.title,
    this.onAddTap,
    this.showAddButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: "pb",
            fontWeight: FontWeight.bold,
            fontSize: AppSize.widthPercent(0.045),
            color: AppColors.textcolor1,
          ),
        ),
        if (showAddButton)
          GestureDetector(
            onTap: onAddTap,
            child: Container(
              height: AppSize.widthPercent(0.09),
              width: AppSize.widthPercent(0.09),
              decoration: BoxDecoration(
                color: AppColors.primary1,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: AppSize.widthPercent(0.05),
              ),
            ),
          ),
      ],
    );
  }
}
