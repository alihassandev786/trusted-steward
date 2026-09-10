import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/treasurecontroller.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';


class Treasure extends StatelessWidget {
  const Treasure({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TreasureController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.heightPercent(0.02)),

              /// TITLE
              Text(
                controller.pageTitle,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.052),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// REMAINING TO ALLOCATE CARD
              Container(
                width: double.infinity,
                height: AppSize.height*0.36,
                padding: EdgeInsets.symmetric(vertical: AppSize.widthPercent(0.07),horizontal: AppSize.widthPercent(0.05)),
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: AppColors.secondary1,
                  borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.allocateCardTitle,
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.048),
                        color: AppColors.textcolor1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.03)),

                    /// SHARED INCOME / EXPENSES
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.sharedIncomeLabel,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.034),
                                  color: AppColors.textcolor2,
                                ),
                              ),
                              SizedBox(height: AppSize.heightPercent(0.007)),
                              Text(
                                controller.sharedIncome,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.07),
                                  color: AppColors.warning,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.sharedExpensesLabel,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.034),
                                  color: AppColors.textcolor2,
                                ),
                              ),
                              SizedBox(height: AppSize.heightPercent(0.007)),
                              Text(
                                controller.sharedExpenses,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.07),
                                  color: AppColors.warning,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.heightPercent(0.035)),

                    /// FAITHFUL GIVING
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.faithfulGivingLabel,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.035),
                            color: AppColors.textcolor2,
                          ),
                        ),
                        Text(
                          controller.faithfulGiving,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.045),
                            color: AppColors.textcolor1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.heightPercent(0.015)),
                    _ProgressBar(percent: controller.faithfulGivingPercent, color: AppColors.warning),

                    SizedBox(height: AppSize.heightPercent(0.025)),

                    /// CURRENT SAVINGS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.currentSavingsLabel,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.038),
                            color: AppColors.textcolor2,
                          ),
                        ),
                        Text(
                          controller.currentSavings,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.045),
                            color: AppColors.textcolor1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// ACTION BUTTONS
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        AppNavigator.pushRight(AppRoutes.sharedbudget);
                      },
                      child: _ActionButton(
                        icon: controller.sharedBudgetIcon,
                        label: controller.sharedBudgetLabel,
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.widthPercent(0.03)),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        AppNavigator.pushRight(AppRoutes.sharedgoal);
                      },
                      child: _ActionButton(
                        icon: controller.sharedGoalsIcon,
                        label: controller.sharedGoalsLabel,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.035)),

              /// KEY TARGETS
              Text(
                controller.keyTargetsTitle,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.048),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.02)),

              ...controller.keyTargets.map(
                    (target) => Padding(
                  padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.012)),
                  child: _TargetCard(
                    title: target.title,
                    trailingText: target.trailingText,
                    percent: target.percent,
                  ),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),
            ],
          ),
        ),
      ),
    );
  }
}

/// GREEN ACTION BUTTON (SHARED BUDGET / SHARED GOALS)
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppSize.heightPercent(0.015)),
      decoration: BoxDecoration(
        color: AppColors.primary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.05)),
      ),
      child: Column(
        children: [
          IconCircle(
            icon: icon,
            iconColor: Colors.white,
            backgroundColor: Colors.black,
            opacity: 0.15,
            height: AppSize.widthPercent(0.1),
            width: AppSize.widthPercent(0.1),
            iconSize: AppSize.widthPercent(0.05),
          ),
          SizedBox(height: AppSize.heightPercent(0.01)),
          Text(
            label,
            style: TextStyle(
              fontFamily: "pm",
              fontWeight: FontWeight.w600,
              fontSize: AppSize.widthPercent(0.03),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/// KEY TARGET CARD
class _TargetCard extends StatelessWidget {
  final String title;
  final String trailingText;
  final double percent;

  const _TargetCard({
    required this.title,
    required this.trailingText,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppSize.widthPercent(0.053),horizontal: AppSize.widthPercent(0.052)),
      decoration: BoxDecoration(
        color: AppColors.secondary1,
        boxShadow: AppShadows.boxShadow,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Text(
                trailingText,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.widthPercent(0.035),
                  color: AppColors.textcolor2,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.heightPercent(0.018)),
          _ProgressBar(percent: percent, color: AppColors.warning),
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