import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/fpermissioncontroller.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';


class Fpermission extends StatelessWidget {
  const Fpermission({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FamilyPermissionsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// GREEN HEADER SECTION WITH CURVES
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top:
                MediaQuery.of(context).padding.top +
                    AppSize.heightPercent(0.015),
                bottom: AppSize.heightPercent(0.035),
                left: AppSize.widthPercent(0.05),
                right: AppSize.widthPercent(0.05),
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
                  /// BACK BUTTON
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: IconCircle(
                        icon: Icons.chevron_left_rounded,
                        iconColor: Colors.white,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        height: AppSize.widthPercent(0.11),
                        width: AppSize.widthPercent(0.11),
                        iconSize: AppSize.widthPercent(0.07),
                      ),
                    ),
                  ),

                  /// PROFILE IMAGE
                  Container(
                    height: AppSize.height * 0.12,
                    width: AppSize.height * 0.12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(controller.avatarImage),
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.015)),

                  /// USER NAME
                  Text(
                    controller.userName,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.058),
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.01)),

                  /// YOU BADGE
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.035),
                      vertical: AppSize.heightPercent(0.005),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                        AppSize.widthPercent(0.05),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: AppSize.widthPercent(0.035),
                        ),
                        SizedBox(width: AppSize.widthPercent(0.012)),
                        Text(
                          controller.userBadge,
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

            /// PERMISSIONS LIST & BUTTON
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthPercent(0.05),
              ),
              child: Column(
                children: [
                  SizedBox(height: AppSize.heightPercent(0.025)),

                  /// LIST OF PERMISSION CARDS
                  ...List.generate(controller.permissions.length, (index) {
                    final permission = controller.permissions[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: AppSize.heightPercent(0.014),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.widthPercent(0.06),
                          vertical: AppSize.heightPercent(0.025),
                        ),
                        decoration: BoxDecoration(
                          boxShadow: AppShadows.boxShadow,
                          color: AppColors.secondary1,
                          borderRadius: BorderRadius.circular(
                            AppSize.widthPercent(0.08),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    permission.title,
                                    style: TextStyle(
                                      fontFamily: "pb",
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSize.widthPercent(0.04),
                                      color: AppColors.textcolor1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppSize.heightPercent(0.004),
                                  ),
                                  Text(
                                    permission.description,
                                    style: TextStyle(
                                      fontFamily: "pr",
                                      fontSize: AppSize.widthPercent(0.031),
                                      color: AppColors.textcolor2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Obx(
                                  () => Transform.scale(
                                scale: 0.85,
                                child: CupertinoSwitch(
                                  activeColor: AppColors.primary1,
                                  value: permission.isEnabled.value,
                                  onChanged: (val) {
                                    controller.togglePermission(index, val);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  SizedBox(height: AppSize.heightPercent(0.015)),

                  /// SAVE PERMISSIONS BUTTON
                  CustomButton(
                    title: "Save Permissions",
                    backgroundColor: AppColors.primary1,
                    onTap: controller.savePermissions,
                  ),

                  SizedBox(height: AppSize.heightPercent(0.1)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
