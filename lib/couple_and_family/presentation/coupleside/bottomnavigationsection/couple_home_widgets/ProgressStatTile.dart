import 'package:flutter/material.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';


/// Row tile used in the "Our Progress" section: icon on the left, a
/// title + subtitle in the middle, and a short progress bar on the right.
/// e.g. Time -> "4/5 daily habits", Talents -> "2 skills growing".
class ProgressStatTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double percent; // 0.0 - 1.0
  final Color progressColor;

  const ProgressStatTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.percent,
    this.progressColor = const Color(0xffC9A227),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.heightPercent(0.016),
        horizontal: AppSize.widthPercent(0.04),
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.height * 0.028),
        boxShadow: AppShadows.boxShadow,
      ),
      child: Row(
        children: [
          IconCircle(
            icon: icon,
            iconColor: AppColors.primary1,
            backgroundColor: AppColors.primary1,
          ),
          SizedBox(width: AppSize.widthPercent(0.03)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "pb",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.widthPercent(0.038),
                    color: AppColors.textcolor1,
                  ),
                ),
                SizedBox(height: AppSize.heightPercent(0.004)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.032),
                    color: AppColors.textcolor2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: AppSize.widthPercent(0.03)),
          SizedBox(
            width: AppSize.widthPercent(0.22),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: percent,
                minHeight: AppSize.heightPercent(0.009),
                backgroundColor: const Color(0xffD9D9D9),
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
