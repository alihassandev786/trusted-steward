import 'package:flutter/material.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';

/// Card used in the "Shared Goals" section, e.g. "Emergency Fund".
/// Shows a title, subtitle, a progress bar, and current/target amount labels.
class GoalCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double percent; // 0.0 - 1.0
  final String currentLabel; // e.g. "$6,500"
  final String targetLabel; // e.g. "Target: $10,000"
  final Color progressColor;

  const GoalCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.percent,
    required this.currentLabel,
    required this.targetLabel,
    this.progressColor = const Color(0xffC9A227),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSize.widthPercent(0.045)),
      decoration: BoxDecoration(
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.05)),
        boxShadow: AppShadows.boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: "pb",
              fontWeight: FontWeight.bold,
              fontSize: AppSize.widthPercent(0.042),
              color: AppColors.textcolor1,
            ),
          ),
          SizedBox(height: AppSize.heightPercent(0.004)),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: "pr",
              fontSize: AppSize.widthPercent(0.033),
              color: AppColors.textcolor2,
            ),
          ),
          SizedBox(height: AppSize.heightPercent(0.02)),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percent,
              minHeight: AppSize.heightPercent(0.01),
              backgroundColor: const Color(0xffD9D9D9),
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),
          SizedBox(height: AppSize.heightPercent(0.012)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currentLabel,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.widthPercent(0.033),
                  color: AppColors.textcolor2,
                ),
              ),
              Text(
                targetLabel,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.033),
                  color: AppColors.textcolor1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
