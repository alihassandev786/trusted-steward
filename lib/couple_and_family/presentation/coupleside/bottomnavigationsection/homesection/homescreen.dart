import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/dashboard_items/steward_score_screen.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';
import '../couple_home_widgets/GoalCard.dart';
import '../../../../core/theme/appcolors.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';
import '../couple_home_widgets/ProgressStatTile.dart';

import '../couple_home_widgets/SectionHeaderAction.dart';
import '../couple_home_widgets/TaskCheckTile.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.heightPercent(0.02)),

              /// HEADER
              Row(
                children: [
                  SizedBox(
                    height: AppSize.widthPercent(0.13),
                    width: AppSize.widthPercent(0.22),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: CircleAvatar(
                            radius: AppSize.widthPercent(0.065),
                            backgroundImage: const AssetImage(
                              "assets/images/home1.png",
                            ),
                          ),
                        ),
                        Positioned(
                          left: AppSize.widthPercent(0.09),
                          child: CircleAvatar(
                            radius: AppSize.widthPercent(0.065),
                            backgroundImage: const AssetImage(
                              "assets/images/home1.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSize.widthPercent(0.015)),
                  Expanded(
                    child: Text(
                      "Good Morning\nDavid & Sarah!",
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.055),
                        color: AppColors.textcolor1,
                        height: 1.15,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppNavigator.pushRight(AppRoutes.notification);
                    },
                    child: IconCircle(
                      icon: Icons.notifications,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.primary1,
                      opacity: 1,
                      height: AppSize.widthPercent(0.13),
                      width: AppSize.widthPercent(0.13),
                      iconSize: AppSize.widthPercent(0.065),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// STEWARDSHIP SCORE CARD
              GestureDetector(
                onTap: (){Get.to(()=>StewardScoreScreen());},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: AppSize.heightPercent(0.02),
                    horizontal: AppSize.widthPercent(0.05),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: AppShadows.boxShadow,
                    color: AppColors.secondary1,
                    borderRadius: BorderRadius.circular(
                      AppSize.widthPercent(0.05),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Shared with Partner",
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.03),
                          color: AppColors.textcolor2,
                        ),
                      ),
                      SizedBox(height: AppSize.heightPercent(0.018)),

                      /// SCORE RING
                      SizedBox(
                        height: AppSize.widthPercent(0.36),
                        width: AppSize.widthPercent(0.36),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: AppSize.widthPercent(0.4),
                              width: AppSize.widthPercent(0.4),
                              child: CircularProgressIndicator(
                                value: 885 / 1000,
                                strokeWidth: AppSize.widthPercent(0.02),
                                backgroundColor: AppColors.warning.withOpacity(
                                  0.15,
                                ),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.warning,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "885",
                                  style: TextStyle(
                                    fontFamily: "pb",
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.widthPercent(0.07),
                                    color: AppColors.warning,
                                  ),
                                ),
                                Text(
                                  "/1000",
                                  style: TextStyle(
                                    fontFamily: "pr",
                                    fontSize: AppSize.widthPercent(0.03),
                                    color: AppColors.textcolor2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: AppSize.heightPercent(0.02)),
                      Text(
                        "Couple Stewardship Score",
                        style: TextStyle(
                          fontFamily: "pb",
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.widthPercent(0.04),
                          color: AppColors.textcolor1,
                        ),
                      ),
                      SizedBox(height: AppSize.heightPercent(0.004)),
                      Text(
                        "Top 15% of households",
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.03),
                          color: AppColors.textcolor2,
                        ),
                      ),

                      SizedBox(height: AppSize.heightPercent(0.012)),

                      /// TIME / TALENT / TREASURE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _StatIcon(
                            icon: Icons.access_time_rounded,
                            label: "Time",
                          ),
                          _StatIcon(
                            icon: Icons.psychology_outlined,
                            label: "Talent",
                          ),
                          _StatIcon(
                            icon: Icons.badge_outlined,
                            label: "Treasure",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// OUR PROGRESS
              Text(
                "Our Progress",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.045),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.018)),

              ProgressStatTile(
                icon: Icons.access_time_rounded,
                title: "Time",
                subtitle: "4/5 daily habits",
                percent: 0.8,
              ),
              SizedBox(height: AppSize.heightPercent(0.012)),
              ProgressStatTile(
                icon: Icons.psychology_outlined,
                title: "Talents",
                subtitle: "2 skills growing",
                percent: 0.4,
              ),
              SizedBox(height: AppSize.heightPercent(0.012)),
              ProgressStatTile(
                icon: Icons.credit_card_outlined,
                title: "Treasure",
                subtitle: "On track",
                percent: 0.9,
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// SHARED GOALS
              SectionHeaderAction(
                title: "Shared Goals",
                onAddTap: () {
                  // TODO: navigate to add-goal screen
                },
              ),
              SizedBox(height: AppSize.heightPercent(0.018)),

              GoalCard(
                title: "Emergency Fund",
                subtitle: "Peace-of-mind liquid reserve",
                percent: 0.65,
                currentLabel: "\$6,500",
                targetLabel: "Target: \$10,000",
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// SHARED TASKS
              SectionHeaderAction(
                title: "Shared Tasks",
                onAddTap: () {
                  // TODO: navigate to add-task screen
                },
              ),
              SizedBox(height: AppSize.heightPercent(0.018)),

              TaskCheckTile(
                title: "Pay Electricity Bill",
                assignedTo: "John",
                dueLabel: "Today",
              ),
              SizedBox(height: AppSize.heightPercent(0.012)),
              TaskCheckTile(
                title: "Plan Weekend Family Sabbath",
                assignedTo: "Sarah",
                dueLabel: "Tomorrow",
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// SHARED LEARNING
              Text(
                "Shared Learning",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.045),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.018)),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: AppColors.secondary1,
                  borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.05),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSize.widthPercent(0.035),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/home2.png",
                            height: AppSize.heightPercent(0.2),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: AppSize.widthPercent(0.03),
                            bottom: AppSize.widthPercent(0.03),
                            child: IconCircle(
                              icon: Icons.arrow_outward_rounded,
                              iconColor: Colors.white,
                              backgroundColor: AppColors.primary1,
                              opacity: 1,
                              height: AppSize.widthPercent(0.11),
                              width: AppSize.widthPercent(0.11),
                              iconSize: AppSize.widthPercent(0.055),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.025)),
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppSize.widthPercent(0.04),
                      ),
                      child: Text(
                        "Module 3 of 5",
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.03),
                          color: AppColors.textcolor2,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.018)),
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppSize.widthPercent(0.04),
                      ),
                      child: Text(
                        "Biblical Foundations",
                        style: TextStyle(
                          fontFamily: "pb",
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.widthPercent(0.048),
                          color: AppColors.textcolor1,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.018)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.widthPercent(0.04),
                      ).copyWith(bottom: AppSize.heightPercent(0.02)),
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: 0.65,
                                minHeight: AppSize.heightPercent(0.008),
                                backgroundColor: const Color(0xffD9D9D9),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.warning,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: AppSize.widthPercent(0.02)),
                          Text(
                            "65%",
                            style: TextStyle(
                              fontFamily: "pr",
                              fontSize: AppSize.widthPercent(0.033),
                              color: AppColors.textcolor2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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

/// TIME / TALENT / TREASURE STAT ITEM
class _StatIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconCircle(
          icon: icon,
          iconColor: AppColors.primary1,
          backgroundColor: AppColors.primary1,
          height: AppSize.height * 0.053,
          width: AppSize.height * 0.053,
          iconSize: AppSize.widthPercent(0.05),
        ),
        SizedBox(height: AppSize.heightPercent(0.006)),
        Text(
          label,
          style: TextStyle(
            fontFamily: "pr",
            fontSize: AppSize.widthPercent(0.03),
            color: AppColors.textcolor2,
          ),
        ),
      ],
    );
  }
}