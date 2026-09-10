import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/auth%20screens/select_use_screen.dart';
import 'package:trusted_steward/couple_and_family/data/controllers/profilecontroller.dart';

import '../../../../core/route/approutes.dart';
import '../../../../core/theme/appcolors.dart';
import '../../../Widgets/AppNavigator.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/Customtile.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';
import '../../../Widgets/logoutdiologe.dart';


class Fprofile extends StatefulWidget {
  const Fprofile({super.key});

  @override
  State<Fprofile> createState() => _FprofileState();
}

class _FprofileState extends State<Fprofile> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FamilyProfileController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// GREEN HEADER SECTION
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + AppSize.heightPercent(0.025),
                bottom: AppSize.heightPercent(0.04),
                left: AppSize.widthPercent(0.06),
                right: AppSize.widthPercent(0.06),
              ),
              decoration: BoxDecoration(
                color: AppColors.primary1,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSize.widthPercent(0.14)),
                  bottomRight: Radius.circular(AppSize.widthPercent(0.14)),
                ),
              ),
              child: Column(
                children: [
                  /// PROFILE IMAGE
                  Container(
                    height: AppSize.height * 0.14,
                    width: AppSize.height * 0.14,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(controller.avatarImage),
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.018)),

                  /// USER NAME
                  Text(
                    controller.name,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.055),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.004)),

                  /// USER EMAIL
                  Text(
                    controller.email,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.032),
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.015)),

                  /// YOU BADGE
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.04),
                      vertical: AppSize.heightPercent(0.006),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(AppSize.widthPercent(0.05)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: AppSize.widthPercent(0.035),
                        ),
                        SizedBox(width: AppSize.widthPercent(0.015)),
                        Text(
                          controller.badgeLabel,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.032),
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
                  SizedBox(height: AppSize.heightPercent(0.025)),

                  /// FAMILY MEMBERS TILES
                  ...controller.familyMembers.map((member) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.012)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: AppSize.heightPercent(0.02),
                          horizontal: AppSize.widthPercent(0.05),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: AppShadows.boxShadow,
                          color: AppColors.secondary1,
                          borderRadius: BorderRadius.circular(AppSize.widthPercent(0.08)),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: AppSize.widthPercent(0.06),
                              backgroundImage: AssetImage(member.image),
                            ),
                            SizedBox(width: AppSize.widthPercent(0.035)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  member.name,
                                  style: TextStyle(
                                    fontFamily: "pb",
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.widthPercent(0.038),
                                    color: AppColors.textcolor1,
                                  ),
                                ),
                                SizedBox(height: AppSize.heightPercent(0.003)),
                                Text(
                                  member.role,
                                  style: TextStyle(
                                    fontFamily: "pr",
                                    fontSize: AppSize.widthPercent(0.031),
                                    color: AppColors.textcolor2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  SizedBox(height: AppSize.heightPercent(0.02)),

                  /// SETTINGS HEADING
                  Text(
                    controller.settingsTitle,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.045),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.015)),

                  /// SETTINGS TILES
                  ...controller.settings.map(
                        (item) => Padding(
                      padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.012)),
                      child:
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.height * 0.03),
                          boxShadow: AppShadows.boxShadow,
                        ),
                        child: CustomTile(
                          onTap: item.onTap,
                          height: AppSize.height * 0.082,
                          title: item.title,
                          titleSize: AppSize.height * 0.018,
                          borderRadius: AppSize.height * 0.03,
                          backgroundColor: AppColors.secondary1,
                          titleColor: AppColors.textcolor1,
                          subtitleColor: AppColors.textcolor2,
                          leading: IconCircle(
                            icon: item.icon,
                            iconColor: AppColors.primary1,
                            backgroundColor: AppColors.primary1.withOpacity(0.12),
                            height: AppSize.widthPercent(0.11),
                            width: AppSize.widthPercent(0.11),
                            iconSize: AppSize.widthPercent(0.05),
                          ),
                          trailing: Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.textcolor1,
                            size: AppSize.widthPercent(0.06),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.02)),

                  /// LOGOUT BUTTON
                  CustomButton(
                    title: controller.logoutLabel,
                    backgroundColor:  Color(0xff8B0000),
                    onTap: (){
                      showLogoutDialog(
                        context,
                        onConfirm: () {
                          Get.to(SelectUseScreen());
                        },
                      );
                    },
                  ),

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