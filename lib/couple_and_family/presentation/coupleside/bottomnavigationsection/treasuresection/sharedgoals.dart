import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/sharedgoalscontroller.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';


class Sharedgoals extends StatefulWidget {
  const Sharedgoals({super.key});

  @override
  State<Sharedgoals> createState() => _SharedgoalsState();
}

class _SharedgoalsState extends State<Sharedgoals> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SharedGoalsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.heightPercent(0.02)),

              /// HEADER (BACK BUTTON + TITLE)
              Row(
                children: [
                  CustomBackButton(),
                  SizedBox(width: AppSize.widthPercent(0.035)),
                  Text(
                    controller.pageTitle,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.058),
                      color: AppColors.textcolor1,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// GOALS LIST
              ...controller.goals.map(
                    (goal) => Padding(
                  padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.012)),
                  child: _GoalCard(goal: goal),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.02)),
            ],
          ),
        ),
      ),
    );
  }
}

/// SHARED GOAL CARD
class _GoalCard extends StatelessWidget {
  final GoalItemData goal;

  const _GoalCard({required this.goal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondary1,
        boxShadow: AppShadows.boxShadow,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// GOAL IMAGE + STATUS BADGE
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.widthPercent(0.06)),
                  topRight: Radius.circular(AppSize.widthPercent(0.06)),
                ),
                child: Image.asset(
                  goal.imagePath,
                  height: AppSize.heightPercent(0.23),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (goal.isCompleted)
                Positioned(
                  right: AppSize.widthPercent(0.035),
                  bottom: AppSize.widthPercent(0.04),
                  child: IconCircle(
                    icon: Icons.check_rounded,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.primary1,
                    opacity: 1,
                    height: AppSize.widthPercent(0.07),
                    width: AppSize.widthPercent(0.07),
                    iconSize: AppSize.widthPercent(0.05),
                  ),
                ),
            ],
          ),

          /// GOAL DETAILS
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.widthPercent(0.05),
              vertical: AppSize.widthPercent(0.06),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  goal.statusLabel,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.034),
                    color: AppColors.textcolor2,
                  ),
                ),
                SizedBox(height: AppSize.heightPercent(0.01)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      goal.title,
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.048),
                        color: AppColors.textcolor1,
                      ),
                    ),
                    Text(
                      goal.rightText,
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.036),
                        color: AppColors.textcolor2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.heightPercent(0.015)),
                _ProgressBar(percent: goal.percent, color: AppColors.warning),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// LINEAR PROGRESS BAR
class _ProgressBar extends StatelessWidget {
  final double percent;
  final Color color;

  const _ProgressBar({required this.percent, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: percent,
        minHeight: AppSize.heightPercent(0.012),
        backgroundColor: const Color(0xffB0B0B0),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}