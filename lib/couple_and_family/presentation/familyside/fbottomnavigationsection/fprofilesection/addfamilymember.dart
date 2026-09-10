import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/boxshadow.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/familysetupcontroller.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/Textfield.dart';


class Addfamilymember extends StatefulWidget {
  const Addfamilymember({super.key});

  @override
  State<Addfamilymember> createState() => _AddfamilymemberState();
}

class _AddfamilymemberState extends State<Addfamilymember> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FamilySetupController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            /// SCROLLABLE TOP CONTENT SECTION
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    /// TOP HEADER WITH BACKGROUND VECTOR / ILLUSTRATION
                    SizedBox(
                      height: AppSize.heightPercent(0.18),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            top: -30,
                            right: -20,
                            child: Image.asset(
                              "assets/images/couplesetup.png",
                              width: AppSize.widthPercent(0.35),
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                              const SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// TITLE AND SUBTITLE
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.widthPercent(0.06),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Add Family Member',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "pb",
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.widthPercent(0.075),
                              color: AppColors.textcolor1,
                              height: 1.1,
                            ),
                          ),
                          SizedBox(height: AppSize.heightPercent(0.015)),
                          Text(
                            "Add the people in your household and choose their role. We'll send an invite to adults, and create a secure profile for children.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "pr",
                              fontSize: AppSize.widthPercent(0.038),
                              color: AppColors.textcolor2,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: AppSize.heightPercent(0.02)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// BOTTOM FIXED CARD CONTAINER
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthPercent(0.06),
                vertical: AppSize.heightPercent(0.03),
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.heightPercent(0.05)),
                  topRight: Radius.circular(AppSize.heightPercent(0.05)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// FIELD LABEL
                  Text(
                    'Family Account Name',
                    style: TextStyle(
                      fontFamily: "pm",
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.widthPercent(0.042),
                      color: AppColors.textcolor1,
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.012)),

                  /// FAMILY NAME INPUT FIELD
                  CustomTextField(
                    controller: controller.familyNameController,
                    hintText: 'e.g : The Harrison Family Trust',
                    height: AppSize.heightPercent(0.06),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.02)),

                  /// PRIMARY MEMBER CARD
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppSize.widthPercent(0.035)),
                    decoration: BoxDecoration(
                      color: AppColors.secondary1,
                      borderRadius: BorderRadius.circular(
                        AppSize.widthPercent(0.06),
                      ),
                      boxShadow: AppShadows.boxShadow,
                    ),
                    child: Row(
                      children: [
                        // Avatar Image
                        CircleAvatar(
                          radius: AppSize.widthPercent(0.065),
                          backgroundImage: const AssetImage(
                            "assets/images/home1.png",
                          ),
                          backgroundColor: AppColors.primary1.withOpacity(0.2),
                        ),

                        SizedBox(width: AppSize.widthPercent(0.035)),

                        // User Info
                        Obx(
                              () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.primaryMemberName.value,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.w700,
                                  fontSize: AppSize.widthPercent(0.042),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              SizedBox(height: AppSize.heightPercent(0.003)),
                              Text(
                                controller.primaryMemberRole.value,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.032),
                                  color: AppColors.textcolor2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),

                        // "You" Pill Badge
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.widthPercent(0.04),
                            vertical: AppSize.heightPercent(0.008),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary1.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(
                              AppSize.widthPercent(0.05),
                            ),
                          ),
                          child: Text(
                            'You',
                            style: TextStyle(
                              fontFamily: "pm",
                              fontSize: AppSize.widthPercent(0.032),
                              color: AppColors.primary1,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.025)),

                  /// ADD GUARDIAN & ADD JUNIOR BUTTONS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(
                        icon: Icons.group_add_rounded,
                        label: 'Add Guardian',
                        onTap: controller.addGuardian,
                      ),
                      _buildActionButton(
                        icon: Icons.sentiment_satisfied_alt_rounded,
                        label: 'Add Junior',
                        onTap: controller.addJunior,
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.heightPercent(0.03)),

                  /// CONTINUE BUTTON
                  CustomButton(title: 'Continue', onTap: (){AppNavigator.pushRight(AppRoutes.fbottomnavigation);}),

                  SizedBox(height: AppSize.heightPercent(0.01)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper Action Circle Button
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            width: AppSize.widthPercent(0.13),
            height: AppSize.widthPercent(0.13),
            decoration: const BoxDecoration(
              color: AppColors.primary1,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: AppSize.widthPercent(0.065),
            ),
          ),
          SizedBox(height: AppSize.heightPercent(0.01)),
          Text(
            label,
            style: TextStyle(
              fontFamily: "pm",
              fontSize: AppSize.widthPercent(0.033),
              fontWeight: FontWeight.w500,
              color: AppColors.primary1,
            ),
          ),
        ],
      ),
    );
  }
}