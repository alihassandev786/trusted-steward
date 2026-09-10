import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/boxshadow.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/expencescontroller.dart';
import '../../../Widgets/Backbutton.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';


class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExpensesController());

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

              /// MONTHLY SPENDING BANNER
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: const Color(0xffF4EFE6),
                  borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.08),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -AppSize.widthPercent(0.1),
                      bottom: -AppSize.heightPercent(0.03),
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
                            "Monthly Spending",
                            style: TextStyle(
                              fontFamily: "pb",
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.widthPercent(0.045),
                              color: AppColors.textcolor1,
                            ),
                          ),
                          SizedBox(height: AppSize.heightPercent(0.008)),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: controller.spentAmount,
                                  style: TextStyle(
                                    fontFamily: "pb",
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.widthPercent(0.052),
                                    color: const Color(0xffC79C3E),
                                  ),
                                ),
                                TextSpan(
                                  text: " ${controller.budgetAmount}",
                                  style: TextStyle(
                                    fontFamily: "pr",
                                    fontSize: AppSize.widthPercent(0.033),
                                    color: const Color(0xff535353),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// ADD EXPENSE BUTTON
              CustomButton(
                title: "+ Add Expense",
                backgroundColor: const Color(0xff2D5C38),
                onTap: controller.addExpense,
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
                      horizontal: AppSize.widthPercent(0.04),
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
                            item.title == "Housing"
                                ? Icons.home_outlined
                                : item.title == "Food"
                                ? Icons.fastfood_outlined
                                : Icons.bolt,
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

              /// RECENT TRANSACTIONS
              Text(
                "Recent",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.048),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.015)),

              ...controller.recentTransactions.map((tx) {
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
                            tx.title.contains("Whole")
                                ? Icons.shopping_cart_outlined
                                : tx.title.contains("City")
                                ? Icons.bolt
                                : Icons.directions_car_outlined,
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
                                tx.title,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.038),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              Text(
                                tx.subtitle,
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
                          tx.amount,
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