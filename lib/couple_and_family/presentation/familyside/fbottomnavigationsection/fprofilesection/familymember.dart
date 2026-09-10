import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/boxshadow.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/faddmembercontroller.dart';
import '../../../../data/controllers/profilecontroller.dart' hide FamilyMemberData;
import '../../../Widgets/Backbutton.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';


class Familymember extends StatelessWidget {
  const Familymember({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FamilyStewardshipController());

    return Scaffold(
      backgroundColor: AppColors.background, // Matching exact screen background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.06)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.heightPercent(0.015)),

              /// APP BAR / TOP HEADER
              Row(
                children: [
                  CustomBackButton(),
                  SizedBox(width: AppSize.widthPercent(0.04)),
                  Text(
                    controller.title,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.062),
                      color: AppColors.textcolor1,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.06)),

              /// ADD MEMBER BUTTON
              CustomButton(
                title: controller.addMemberBtnText,
                backgroundColor: const Color(0xff2D5C38),
                onTap: controller.addMember,
              ),

              SizedBox(height: AppSize.heightPercent(0.04)),

              /// GUARDIANS SECTION
              Text(
                "Guardians",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.048),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.018)),

              Obx(
                    () => Column(
                  children: controller.guardians.map((member) {
                    return _MemberTile(
                      member: member,
                      onTap: () => controller.onMemberTap(member),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.02)),

              /// JUNIORS SECTION
              Text(
                "Juniors",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.048),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.018)),

              Obx(
                    () => Column(
                  children: controller.juniors.map((member) {
                    return _MemberTile(
                      member: member,
                      onTap: () => controller.onMemberTap(member),
                    );
                  }).toList(),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.035)),
            ],
          ),
        ),
      ),
    );
  }
}

/// MEMBER TILE COMPONENT
class _MemberTile extends StatelessWidget {
  final FamilyMemberData member;
  final VoidCallback onTap;

  const _MemberTile({required this.member, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.01)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.08)),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.widthPercent(0.06),
            vertical: AppSize.heightPercent(0.027),
          ),
          decoration: BoxDecoration(
            boxShadow: AppShadows.boxShadow,
            color: const Color(0xffF4EFE6),
            borderRadius: BorderRadius.circular(AppSize.widthPercent(0.08)),
          ),
          child: Row(
            children: [
              /// AVATAR
              Container(
                height: AppSize.widthPercent(0.14),
                width: AppSize.widthPercent(0.14),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.07),
                  ),
                  child: Image.asset(member.imagePath, fit: BoxFit.cover),
                ),
              ),

              SizedBox(width: AppSize.widthPercent(0.04)),

              /// DETAILS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.name,
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.04),
                        color: AppColors.textcolor1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.004)),
                    Text(
                      member.designation,
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.032),
                        color: const Color(0xff686868),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}