import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';

import '../../../../../core/theme/appcolors.dart';
import '../../../../../data/controllers/privacysecuritycontroller.dart';
import '../../../../Widgets/Customtile.dart';
import '../../../../Widgets/MediaqueryHelperfile.dart';
import '../../../../Widgets/boxshadow.dart';
import '../../../../Widgets/iconcircle.dart';




class PrivacySecurity extends StatefulWidget {
  const PrivacySecurity({super.key});

  @override
  State<PrivacySecurity> createState() => _PrivacySecurityState();
}

class _PrivacySecurityState extends State<PrivacySecurity> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PrivacySecurityController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
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
                  Expanded(
                    child: Text(
                      controller.pageTitle,
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.058),
                        color: AppColors.textcolor1,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.045)),

              /// LIST (CustomTile)
              ...controller.items.map(
                    (item) => Padding(
                  padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.01)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.height*0.03),
                      boxShadow: AppShadows.boxShadow,
                    ),
                    child: CustomTile(
                      onTap: item.onTap,
                      height: AppSize.height * 0.088,
                      title: item.title,
                      titleSize: AppSize.height * 0.018,
                      borderRadius: AppSize.height * 0.03,
                      backgroundColor: AppColors.secondary1,
                      titleColor: AppColors.textcolor1,
                      subtitleColor: AppColors.textcolor2,
                      leading: IconCircle(
                        icon: item.icon,
                        iconColor: AppColors.primary1,
                        backgroundColor: AppColors.primary1,
                        height: AppSize.widthPercent(0.11),
                        width: AppSize.widthPercent(0.11),
                        iconSize: AppSize.widthPercent(0.045),
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
            ],
          ),
        ),
      ),
    );
  }
}