import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/treasurecontroller.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';

class Ftreasure extends StatefulWidget {
  const Ftreasure({super.key});

  @override
  State<Ftreasure> createState() => _FtreasureState();
}

class _FtreasureState extends State<Ftreasure> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Ftreasurecontroller());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.heightPercent(0.02)),

              /// PAGE TITLE
              Text(
                controller.pageTitle,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.055),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// SEPTEMBER BUDGET CARD
              Center(
                child: Container(
                  width: AppSize.width*0.89,
                  padding: EdgeInsets.symmetric(
                    vertical: AppSize.heightPercent(0.045),
                    horizontal: AppSize.widthPercent(0.06),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: AppShadows.boxShadow,
                    color: AppColors.secondary1,
                    borderRadius: BorderRadius.circular(
                      AppSize.widthPercent(0.06),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "September Budget",
                        style: TextStyle(
                          fontFamily: "pb",
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.widthPercent(0.045),
                          color: AppColors.textcolor1,
                        ),
                      ),
                      SizedBox(height: AppSize.heightPercent(0.02)),

                      /// SPENT & REMAINING ROW
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Spent this month",
                                  style: TextStyle(
                                    fontFamily: "pr",
                                    fontSize: AppSize.widthPercent(0.032),
                                    color: AppColors.textcolor2,
                                  ),
                                ),
                                SizedBox(height: AppSize.heightPercent(0.005)),
                                Text(
                                  "\$6,500",
                                  style: TextStyle(
                                    fontFamily: "pb",
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.widthPercent(0.065),
                                    color: AppColors.warning,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Remaining",
                                  style: TextStyle(
                                    fontFamily: "pr",
                                    fontSize: AppSize.widthPercent(0.032),
                                    color: AppColors.textcolor2,
                                  ),
                                ),
                                SizedBox(height: AppSize.heightPercent(0.005)),
                                Text(
                                  "\$4,250",
                                  style: TextStyle(
                                    fontFamily: "pb",
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSize.widthPercent(0.065),
                                    color: AppColors.warning,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: AppSize.heightPercent(0.025)),

                      /// BUDGET PROGRESS INDICATOR WITH VALUES ($0 & $12,000)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$0",
                            style: TextStyle(
                              fontFamily: "pr",
                              fontSize: AppSize.widthPercent(0.032),
                              color: AppColors.textcolor2,
                            ),
                          ),
                          Text(
                            "\$12,000",
                            style: TextStyle(
                              fontFamily: "pb",
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.widthPercent(0.038),
                              color: AppColors.textcolor1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.heightPercent(0.008)),
                      const _ProgressBar(percent: 0.68, color: AppColors.warning),
                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// 2x2 ACTION BUTTON GRID (Income, Expenses, Savings, Giving)
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.south_west_rounded,
                          label: "Income",
                          onTap: () {
                            AppNavigator.pushRight(AppRoutes.income);
                          },
                        ),
                      ),
                      SizedBox(width: AppSize.widthPercent(0.035)),
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.north_east_rounded,
                          label: "Expenses",
                          onTap: () {
                            AppNavigator.pushRight(AppRoutes.expences);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.heightPercent(0.015)),
                  Row(
                    children: [
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.savings_outlined,
                          label: "Savings",
                          onTap: () {
                            AppNavigator.pushRight(AppRoutes.saving);
                          },
                        ),
                      ),
                      SizedBox(width: AppSize.widthPercent(0.035)),
                      Expanded(
                        child: _ActionButton(
                          icon: Icons.favorite_rounded,
                          label: "Giving",
                          onTap: () {
                            AppNavigator.pushRight(AppRoutes.giving);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// CATEGORIES HEADING WITH MANAGE ACTION
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.048),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Manage",
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.035),
                        color: AppColors.primary1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.02)),

              /// CATEGORIES LIST
              ...controller.categories.map(
                    (category) => Padding(
                  padding: EdgeInsets.only(
                    bottom: AppSize.heightPercent(0.012),
                  ),
                  child: _TargetCard(
                    title: category.title,
                    trailingText: category.trailingText,
                    percent: category.percent,
                  ),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),
            ],
          ),
        ),
      ),
    );
  }
}

/// GREEN GRID ACTION BUTTON (Income, Expenses, Savings, Giving)
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSize.heightPercent(0.022)),
        decoration: BoxDecoration(
          boxShadow: AppShadows.boxShadow,
          color: AppColors.primary1,
          borderRadius: BorderRadius.circular(AppSize.widthPercent(0.05)),
        ),
        child: Column(
          children: [
            IconCircle(
              icon: icon,
              iconColor: Colors.white,
              backgroundColor: Colors.black,
              opacity: 0.15,
              height: AppSize.widthPercent(0.09),
              width: AppSize.widthPercent(0.09),
              iconSize: AppSize.widthPercent(0.045),
            ),
            SizedBox(height: AppSize.heightPercent(0.008)),
            Text(
              label,
              style: TextStyle(
                fontFamily: "pm",
                fontWeight: FontWeight.w600,
                fontSize: AppSize.widthPercent(0.032),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// CATEGORY PROGRESS CARD
class _TargetCard extends StatelessWidget {
  final String title;
  final String trailingText;
  final double percent;

  const _TargetCard({
    required this.title,
    required this.trailingText,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSize.heightPercent(0.03),
        horizontal: AppSize.widthPercent(0.06),
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary1,
          boxShadow: AppShadows.boxShadow,
          borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.04),
                  color: AppColors.textcolor1,
                ),
              ),
              Text(
                trailingText,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.widthPercent(0.031),
                  color: AppColors.textcolor2,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.heightPercent(0.012)),
          _ProgressBar(percent: percent, color: AppColors.warning),
        ],
      ),
    );
  }
}

/// LINEAR PROGRESS BAR
class _ProgressBar extends StatelessWidget {
  final double percent;
  final Color color;

  const _ProgressBar({required this.percent, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: percent,
        minHeight: AppSize.heightPercent(0.009),
        backgroundColor: const Color(0xffD6D2C4),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}