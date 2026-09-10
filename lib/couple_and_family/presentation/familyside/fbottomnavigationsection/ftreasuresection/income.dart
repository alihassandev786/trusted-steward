import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/boxshadow.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/incomecontroller.dart';
import '../../../Widgets/Backbutton.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';


class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IncomeController());

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

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// TOTAL INCOME BANNER
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: AppColors.secondary1,
                  borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.08),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -AppSize.widthPercent(0.08),
                      top: -AppSize.heightPercent(0.03),
                      child: Container(
                        height: AppSize.widthPercent(0.2),
                        width: AppSize.widthPercent(0.3),
                        decoration: BoxDecoration(
                          color: const Color(0xffE2C98A).withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppSize.widthPercent(0.05),
                        top: AppSize.heightPercent(0.02),
                        right: AppSize.widthPercent(0.05),
                        bottom: AppSize.heightPercent(0.02),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Monthly Income",
                            style: TextStyle(
                              fontFamily: "pb",
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.widthPercent(0.045),
                              color: AppColors.textcolor1,
                            ),
                          ),
                          SizedBox(height: AppSize.heightPercent(0.008)),
                          Row(
                            children: [
                              Text(
                                controller.totalIncome,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.052),
                                  color: const Color(0xffC79C3E),
                                ),
                              ),
                              SizedBox(width: AppSize.widthPercent(0.02)),
                              const Icon(
                                Icons.trending_up,
                                size: 16,
                                color: Color(0xff535353),
                              ),
                              SizedBox(width: AppSize.widthPercent(0.01)),
                              Text(
                                controller.growth,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.031),
                                  color: const Color(0xff535353),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// ADD INCOME BUTTON
              CustomButton(
                title: "+ Add Income",
                backgroundColor: const Color(0xff2D5C38),
                onTap: controller.addIncome,
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// CATEGORIES SECTION
              Text(
                "Categories",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.048),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.015)),

              ...controller.categories.map((item) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: AppSize.heightPercent(0.012),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.05),
                      vertical: AppSize.heightPercent(0.02),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: AppShadows.boxShadow,
                      color: const Color(0xffF4EFE6),
                      borderRadius: BorderRadius.circular(
                        AppSize.widthPercent(0.06),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppSize.widthPercent(0.025)),
                          decoration: const BoxDecoration(
                            color: Color(0xffC2D3C0),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            item.title == "Salary"
                                ? Icons.work_outline
                                : item.title == "Freelance"
                                ? Icons.content_cut
                                : Icons.card_giftcard,
                            color: const Color(0xff2D5C38),
                            size: AppSize.widthPercent(0.055),
                          ),
                        ),
                        SizedBox(width: AppSize.widthPercent(0.035)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.038),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              Text(
                                item.amount,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.032),
                                  color: const Color(0xff686868),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: AppSize.widthPercent(0.3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppSize.widthPercent(0.02),
                            ),
                            child: LinearProgressIndicator(
                              value: item.progress,
                              minHeight: AppSize.heightPercent(0.012),
                              backgroundColor: const Color(0xffA8A8A8),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xffC79C3E),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// RECENT DEPOSITS
              Text(
                "Recent Deposits",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.048),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.015)),

              ...controller.recentDeposits.map((deposit) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: AppSize.heightPercent(0.012),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.04),
                      vertical: AppSize.heightPercent(0.018),
                    ),
                    decoration: BoxDecoration(
                      boxShadow: AppShadows.boxShadow,
                      color: const Color(0xffF4EFE6),
                      borderRadius: BorderRadius.circular(
                        AppSize.widthPercent(0.06),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppSize.widthPercent(0.025)),
                          decoration: const BoxDecoration(
                            color: Color(0xffC2D3C0),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            deposit.title.contains("Tech")
                                ? Icons.domain
                                : deposit.title.contains("Sarah")
                                ? Icons.person_outline
                                : Icons.savings_outlined,
                            color: const Color(0xff2D5C38),
                            size: AppSize.widthPercent(0.055),
                          ),
                        ),
                        SizedBox(width: AppSize.widthPercent(0.035)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                deposit.title,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.038),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              Text(
                                deposit.subtitle,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.031),
                                  color: const Color(0xff686868),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          deposit.amount,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.04),
                            color: AppColors.textcolor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              SizedBox(height: AppSize.heightPercent(0.03)),
            ],
          ),
        ),
      ),
    );
  }
}