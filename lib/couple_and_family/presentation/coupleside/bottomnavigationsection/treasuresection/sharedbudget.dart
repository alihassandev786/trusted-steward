import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/sharedbudgetcontroller.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';


class Sharedbudget extends StatefulWidget {
  const Sharedbudget({super.key});

  @override
  State<Sharedbudget> createState() => _SharedbudgetState();
}

class _SharedbudgetState extends State<Sharedbudget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SharedBudgetController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  Text(
                    controller.pageTitle,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.058),
                      color: AppColors.textcolor1,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// REMAINING TO ALLOCATE CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: AppSize.widthPercent(0.07),
                  horizontal: AppSize.widthPercent(0.05),
                ),
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: AppColors.secondary1,
                  borderRadius: BorderRadius.circular(AppSize.widthPercent(0.08)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.allocateCardTitle,
                      style: TextStyle(
                        fontFamily: "pb",
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.widthPercent(0.048),
                        color: AppColors.textcolor1,
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.03)),

                    /// SHARED INCOME / EXPENSES
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.sharedIncomeLabel,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.034),
                                  color: AppColors.textcolor2,
                                ),
                              ),
                              SizedBox(height: AppSize.heightPercent(0.007)),
                              Text(
                                controller.sharedIncome,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.07),
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
                                controller.sharedExpensesLabel,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.034),
                                  color: AppColors.textcolor2,
                                ),
                              ),
                              SizedBox(height: AppSize.heightPercent(0.007)),
                              Text(
                                controller.sharedExpenses,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.07),
                                  color: AppColors.warning,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.heightPercent(0.035)),

                    /// FAITHFUL GIVING
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.faithfulGivingLabel,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.035),
                            color: AppColors.textcolor2,
                          ),
                        ),
                        Text(
                          controller.faithfulGiving,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.045),
                            color: AppColors.textcolor1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.heightPercent(0.015)),
                    _ProgressBar(percent: controller.faithfulGivingPercent, color: AppColors.warning),

                    SizedBox(height: AppSize.heightPercent(0.025)),

                    /// CURRENT SAVINGS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.currentSavingsLabel,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.038),
                            color: AppColors.textcolor2,
                          ),
                        ),
                        Text(
                          controller.currentSavings,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.045),
                            color: AppColors.textcolor1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// KEY TARGETS
              Text(
                controller.keyTargetsTitle,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.048),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.02)),

              ...controller.keyTargets.map(
                    (target) => Padding(
                  padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.012)),
                  child: _TargetCard(
                    title: target.title,
                    trailingText: target.trailingText,
                    percent: target.percent,
                  ),
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.018)),

              /// CATEGORIES
              Text(
                controller.categoriesTitle,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.048),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.02)),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSize.widthPercent(0.02),
                  mainAxisSpacing: AppSize.widthPercent(0.02),
                  childAspectRatio: 0.94,
                ),
                itemBuilder: (context, index) {
                  final category = controller.categories[index];
                  return _CategoryCard(category: category);
                },
              ),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// RECENT SHARED
              Text(
                controller.recentSharedTitle,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.045),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.018)),

              ...controller.recentShared.map(
                    (item) => Padding(
                  padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.012)),
                  child: _RecentSharedTile(item: item),
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

/// KEY TARGET CARD
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
        vertical: AppSize.widthPercent(0.055),
        horizontal: AppSize.widthPercent(0.052),
      ),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: AppColors.secondary1,
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
                  fontSize: AppSize.widthPercent(0.042),
                  color: AppColors.textcolor1,
                ),
              ),
              Text(
                trailingText,
                style: TextStyle(
                  fontFamily: "pr",
                  fontSize: AppSize.widthPercent(0.035),
                  color: AppColors.textcolor2,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.heightPercent(0.018)),
          _ProgressBar(percent: percent, color: AppColors.warning),
        ],
      ),
    );
  }
}

/// CATEGORY GRID CARD
class _CategoryCard extends StatelessWidget {
  final CategoryItemData category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSize.widthPercent(0.05),
        horizontal: AppSize.widthPercent(0.03),
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary1,
        boxShadow: AppShadows.boxShadow,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconCircle(
            icon: category.icon,
            iconColor: AppColors.primary1,
            backgroundColor: AppColors.primary1,
            height: AppSize.widthPercent(0.13),
            width: AppSize.widthPercent(0.13),
            iconSize: AppSize.widthPercent(0.065),
          ),
          SizedBox(height: AppSize.heightPercent(0.012)),
          Text(
            category.title,
            style: TextStyle(
              fontFamily: "pr",
              fontSize: AppSize.widthPercent(0.035),
              color: AppColors.textcolor2,
            ),
          ),
          if (!category.isAddCategory) ...[
            SizedBox(height: AppSize.heightPercent(0.008)),
            Text(
              category.amount,
              style: TextStyle(
                fontFamily: "pb",
                fontWeight: FontWeight.bold,
                fontSize: AppSize.widthPercent(0.048),
                color: AppColors.textcolor1,
              ),
            ),
            SizedBox(height: AppSize.heightPercent(0.006)),
            Text(
              category.subText,
              style: TextStyle(
                fontFamily: "pr",
                fontSize: AppSize.widthPercent(0.028),
                color: AppColors.textcolor2,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// RECENT SHARED TRANSACTION TILE
class _RecentSharedTile extends StatelessWidget {
  final RecentSharedData item;

  const _RecentSharedTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSize.widthPercent(0.05),
        horizontal: AppSize.widthPercent(0.05),
      ),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.06)),
      ),
      child: Row(
        children: [
          IconCircle(
            icon: item.icon,
            iconColor: AppColors.primary1,
            backgroundColor: AppColors.primary1,
            height: AppSize.widthPercent(0.1),
            width: AppSize.widthPercent(0.1),
            iconSize: AppSize.widthPercent(0.045),
          ),
          SizedBox(width: AppSize.widthPercent(0.033)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontFamily: "pb",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.widthPercent(0.036),
                    color: AppColors.textcolor1,
                  ),
                ),
                SizedBox(height: AppSize.heightPercent(0.004)),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.032),
                    color: AppColors.textcolor2,
                  ),
                ),
              ],
            ),
          ),
          Text(
            item.amount,
            style: TextStyle(
              fontFamily: "pb",
              fontWeight: FontWeight.bold,
              fontSize: AppSize.widthPercent(0.038),
              color: AppColors.textcolor1,
            ),
          ),
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
        minHeight: AppSize.heightPercent(0.012),
        backgroundColor: const Color(0xffB0B0B0),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}