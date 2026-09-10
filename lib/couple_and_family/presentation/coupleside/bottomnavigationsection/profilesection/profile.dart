import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Button.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/boxshadow.dart';

import '../../../../../INDIVIDUAL SIDE/auth screens/select_use_screen.dart';
import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/profilecontroller.dart';
import '../../../Widgets/Customtile.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/iconcircle.dart';
import '../../../Widgets/logoutdiologe.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// GREEN HEADER
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + AppSize.heightPercent(0.025),
                bottom: AppSize.heightPercent(0.035),
                left: AppSize.widthPercent(0.06),
                right: AppSize.widthPercent(0.06),
              ),
              decoration: BoxDecoration(
                boxShadow: AppShadows.boxShadow,
                color: AppColors.primary1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSize.widthPercent(0.14)),
                  bottomRight: Radius.circular(AppSize.widthPercent(0.14)),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: AppSize.height*0.155,
                    width: AppSize.height*0.155,
                    decoration: BoxDecoration(
                      boxShadow: AppShadows.boxShadow,
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(controller.avatarImage),
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.02)),
                  Text(
                    controller.name,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.055),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.006)),
                  Text(
                    controller.email,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.032),
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.018)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.03),
                      vertical: AppSize.heightPercent(0.007),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSize.widthPercent(0.05)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.people_alt_outlined,
                          color: Colors.white,
                          size: AppSize.widthPercent(0.035),
                        ),
                        SizedBox(width: AppSize.widthPercent(0.018)),
                        Text(
                          controller.connectedLabel,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.03),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.heightPercent(0.03)),

                  /// STEWARDSHIP SCORE CARD
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: AppSize.heightPercent(0.028)),
                    decoration: BoxDecoration(
                      boxShadow: AppShadows.boxShadow,
                      color: AppColors.secondary1,
                      borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          controller.stewardshipTitle,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.04),
                            color: AppColors.textcolor1,
                          ),
                        ),
                        SizedBox(height: AppSize.heightPercent(0.025)),
                        Container(
                          height: AppSize.widthPercent(0.4),
                          width: AppSize.widthPercent(0.4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.warning,
                              width: AppSize.widthPercent(0.016),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.score,
                                  style: TextStyle(
                                    fontFamily: "pb",
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.widthPercent(0.09),
                                    color: AppColors.warning,
                                  ),
                                ),
                                Text(
                                  controller.scoreLabel,
                                  style: TextStyle(
                                    fontFamily: "pr",
                                    fontSize: AppSize.widthPercent(0.036),
                                    color: AppColors.textcolor2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.02)),

                  /// STATS ROW
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          icon: Icons.menu_book_outlined,
                          value: controller.learningProgress,
                          label: controller.learningProgressLabel,
                        ),
                      ),
                      SizedBox(width: AppSize.widthPercent(0.03)),
                      Expanded(
                        child: _StatCard(
                          icon: Icons.flag_outlined,
                          value: controller.activeGoals,
                          label: controller.activeGoalsLabel,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.heightPercent(0.03)),

                  /// SETTINGS LIST (CustomTile)
                  ...controller.settings.map(
                        (item) => Padding(
                      padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.01)),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: AppShadows.boxShadow,
                          borderRadius: BorderRadius.circular(AppSize.height*0.03),
                        ),
                        child: CustomTile(
                          onTap: item.onTap,
                          height: AppSize.height * 0.095,
                          title: item.title,
                          titleSize: AppSize.height*0.02,
                          borderRadius: AppSize.height*0.03,
                          backgroundColor: AppColors.secondary1,
                          titleColor: AppColors.textcolor1,
                          subtitleColor: AppColors.textcolor2,
                          leading: IconCircle(
                            icon: item.icon,
                            iconColor: AppColors.primary1,
                            backgroundColor: AppColors.primary1,
                            height: AppSize.widthPercent(0.12),
                            width: AppSize.widthPercent(0.12),
                            iconSize: AppSize.widthPercent(0.05),
                          ),
                          trailing: Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.primary1,
                            size: AppSize.widthPercent(0.07),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.015)),

                  /// LOGOUT BUTTON
                  CustomButton(title: controller.logoutLabel, 
                      backgroundColor: Color(0xff7A0000),
                      onTap: (){
                        showLogoutDialog(
                          context,
                          onConfirm: () {
                            Get.to(SelectUseScreen());
                          },
                        );
                      }),
                  SizedBox(height: AppSize.heightPercent(0.03)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// STAT CARD (LEARNING PROGRESS / ACTIVE GOALS)
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppSize.heightPercent(0.03)),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
      ),
      child: Column(
        children: [
          IconCircle(
            icon: icon,
            iconColor: AppColors.primary1,
            backgroundColor: AppColors.primary1,
            height: AppSize.widthPercent(0.13),
            width: AppSize.widthPercent(0.13),
            iconSize: AppSize.widthPercent(0.065),
          ),
          SizedBox(height: AppSize.heightPercent(0.015)),
          Text(
            value,
            style: TextStyle(
              fontFamily: "pb",
              fontWeight: FontWeight.bold,
              fontSize: AppSize.widthPercent(0.052),
              color: AppColors.textcolor1,
            ),
          ),
          SizedBox(height: AppSize.heightPercent(0.004)),
          Text(
            label,
            style: TextStyle(
              fontFamily: "pr",
              fontSize: AppSize.widthPercent(0.033),
              color: AppColors.textcolor2,
            ),
          ),
        ],
      ),
    );
  }
}