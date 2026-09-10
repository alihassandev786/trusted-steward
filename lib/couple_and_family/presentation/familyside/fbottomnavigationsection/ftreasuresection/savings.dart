import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/boxshadow.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/savingcontroller.dart';
import '../../../Widgets/Backbutton.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';

class Savings extends StatelessWidget {
  const Savings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SavingsController());

    return Scaffold(
      backgroundColor: const Color(0xffFBF9F1),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.06)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.heightPercent(0.015)),

              /// APP BAR HEADER
              Row(
                children: [
                  CustomBackButton(),
                  SizedBox(width: AppSize.widthPercent(0.04)),
                  Text(
                    controller.title,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.065),
                      color: AppColors.textcolor1,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// SAVINGS GOALS CARDS
              ...controller.goals.map((goal) {
                return Padding(
                  padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.02)),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppSize.widthPercent(0.07)),
                    decoration: BoxDecoration(
                      boxShadow: AppShadows.boxShadow,
                      color: const Color(0xffF4EFE6),
                      borderRadius: BorderRadius.circular(
                        AppSize.widthPercent(0.08),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          goal.category,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.032),
                            color: const Color(0xff686868),
                          ),
                        ),
                        SizedBox(height: AppSize.heightPercent(0.004)),
                        Text(
                          goal.title,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.048),
                            color: AppColors.textcolor1,
                          ),
                        ),
                        SizedBox(height: AppSize.heightPercent(0.018)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              goal.savedAmount,
                              style: TextStyle(
                                fontFamily: "pb",
                                fontWeight: FontWeight.bold,
                                fontSize: AppSize.widthPercent(0.045),
                                color: const Color(0xffC79C3E),
                              ),
                            ),
                            Text(
                              goal.targetAmount,
                              style: TextStyle(
                                fontFamily: "pr",
                                fontSize: AppSize.widthPercent(0.035),
                                color: const Color(0xff535353),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.heightPercent(0.01)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppSize.widthPercent(0.04),
                          ),
                          child: LinearProgressIndicator(
                            value: goal.progress,
                            minHeight: AppSize.heightPercent(0.012),
                            backgroundColor: const Color(0xffA8A8A8),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xffC79C3E),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.heightPercent(0.01)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              goal.estimatedDate,
                              style: TextStyle(
                                fontFamily: "pr",
                                fontSize: AppSize.widthPercent(0.03),
                                color: const Color(0xff686868),
                              ),
                            ),
                            Text(
                              goal.fundedPercentage,
                              style: TextStyle(
                                fontFamily: "pr",
                                fontSize: AppSize.widthPercent(0.03),
                                color: const Color(0xffC79C3E),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.heightPercent(0.02)),
                        CustomButton(
                          title: "Add Funds",
                          backgroundColor: const Color(0xff2D5C38),
                          onTap: () => controller.addFunds(goal),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              SizedBox(height: AppSize.heightPercent(0.04)),

              /// CREATE NEW GOAL BUTTON
              CustomButton(
                title: "Create New Goal",
                backgroundColor: const Color(0xff2D5C38),
                onTap: controller.createNewGoal,
              ),

              SizedBox(height: AppSize.heightPercent(0.035)),
            ],
          ),
        ),
      ),
    );
  }
}