import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Button.dart';

import '../../../../../core/theme/appcolors.dart';
import '../../../../../data/controllers/updatepasswordcontroller.dart';
import '../../../../Widgets/MediaqueryHelperfile.dart';
import '../../../../Widgets/Textfield.dart';
import '../../../../Widgets/boxshadow.dart';
import '../../../../Widgets/iconcircle.dart';

class Updatepassword extends StatefulWidget {
  const Updatepassword({super.key});

  @override
  State<Updatepassword> createState() => _UpdatepasswordState();
}

class _UpdatepasswordState extends State<Updatepassword> {
  final controller = Get.put(Updatepasswordcontroller());

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.widthPercent(0.05),
                    vertical: AppSize.heightPercent(0.02),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CustomBackButton(),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: AppSize.widthPercent(0.05),
                right: AppSize.widthPercent(0.05),
                top: AppSize.heightPercent(0.045),
                bottom: AppSize.heightPercent(0.03),
              ),
              decoration: BoxDecoration(
                boxShadow: AppShadows.boxShadow,
                color: AppColors.secondary1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.widthPercent(0.08)),
                  topRight: Radius.circular(AppSize.widthPercent(0.08)),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.title,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.062),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.01)),
                  Text(
                    controller.subtitle,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.04),
                      color: AppColors.textcolor2,
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.03)),

                  /// CURRENT PASSWORD
                  CustomTextField(
                    controller: _currentPasswordController,
                    hintText: controller.currentPasswordHint,
                    obscureText: true,
                    height: AppSize.heightPercent(0.065),
                    padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.01)),
                  ),

                  /// NEW PASSWORD
                  CustomTextField(
                    controller: _newPasswordController,
                    hintText: controller.newPasswordHint,
                    obscureText: true,
                    height: AppSize.heightPercent(0.065),
                    padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.01)),
                  ),

                  /// CONFIRM PASSWORD
                  CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: controller.confirmPasswordHint,
                    obscureText: true,
                    height: AppSize.heightPercent(0.065),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.035)),
                  CustomButton(title: controller.updateLabel, onTap: (){
                    Get.back();
                  })
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
