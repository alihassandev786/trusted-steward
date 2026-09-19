import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';
import 'package:trusted_steward/couple_and_family/presentation/coupleside/bottomnavigationsection/treasuresection/giving_hub_screen.dart';

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
                  fontSize: AppSize.widthPercent(0.06),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// CURRENT TRANSACTION CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: AppSize.widthPercent(0.06),
                  horizontal: AppSize.widthPercent(0.05),
                ),
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: AppColors.secondary1,
                  borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Transaction",
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.048),
                        color: AppColors.textcolor1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.03)),

                    /// FAITHFUL GIVING ROW
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.faithfulGivingLabel,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.036),
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
                    SizedBox(height: AppSize.heightPercent(0.022)),

                    /// CURRENT BUDGET ROW
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Current Budget",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.036),
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

              /// ACTION BUTTONS - 2x2 GRID
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        AppNavigator.pushRight(AppRoutes.sharedbudget);
                      },
                      child: _ActionButton(
                        icon: Icons.groups_outlined,
                        label: "Shared Budget",
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.widthPercent(0.03)),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        AppNavigator.pushRight(AppRoutes.sharedgoal);
                      },
                      child: _ActionButton(
                        icon: Icons.favorite_border_rounded,
                        label: "Shared Goals",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.heightPercent(0.02)),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(()=>GivingHubScreen());
                      },
                      child: _ActionButton(
                        icon: Icons.volunteer_activism_outlined,
                        label: "Giving",
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.widthPercent(0.03)),
                  // Expanded(
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       // TODO: navigate to Budget screen
                  //     },
                  //     child: _ActionButton(
                  //       icon: Icons.account_balance_wallet_outlined,
                  //       label: "Budget",
                  //     ),
                  //   ),
                  // ),
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

/// GREEN ACTION BUTTON (SHARED BUDGET / SHARED GOALS / GIVING / BUDGET)
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppSize.heightPercent(0.022)),
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
              fontSize: AppSize.widthPercent(0.032),
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
      padding: EdgeInsets.symmetric(
        vertical: AppSize.widthPercent(0.053),
        horizontal: AppSize.widthPercent(0.052),
      ),
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