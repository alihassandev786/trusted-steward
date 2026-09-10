import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/boxshadow.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/iconcircle.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/givingcontroller.dart';
import '../../../Widgets/Backbutton.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';


class Giving extends StatelessWidget {
  const Giving({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GivingController());

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
                    "Giving Hub",
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

              /// TOTAL GENEROSITY CARD
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
                      right: -AppSize.widthPercent(0.08),
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
                            "Total Generosity This Year",
                            style: TextStyle(
                              fontFamily: "pb",
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.widthPercent(0.045),
                              color: AppColors.textcolor1,
                            ),
                          ),
                          SizedBox(height: AppSize.heightPercent(0.008)),
                          Text(
                            controller.totalGenerosity,
                            style: TextStyle(
                              fontFamily: "pb",
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.widthPercent(0.052),
                              color: const Color(0xffC79C3E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.015)),

              /// GENEROSITY GOAL CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(AppSize.widthPercent(0.05)),
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: AppColors.warning,
                  borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.08),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Generosity Goal",
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.04),
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          controller.goalPercentage,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.032),
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.heightPercent(0.012)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSize.widthPercent(0.02),
                      ),
                      child: LinearProgressIndicator(
                        value: controller.goalProgress,
                        minHeight: AppSize.heightPercent(0.008),
                        backgroundColor: Colors.white.withOpacity(0.4),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.heightPercent(0.012)),
                    Text(
                      "You are on track to meet your annual giving target. Well done!",
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.032),
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// ACTIVE COMMITMENTS HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Active Commitments",
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.048),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.manageCommitments,
                    child: Text(
                      "Manage",
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.033),
                        color: const Color(0xff2D5C38),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.015)),

              ...controller.commitments.map((c) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: AppSize.heightPercent(0.012),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.05),
                      vertical: AppSize.heightPercent(0.025),
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
                        IconCircle(icon:  c.title.contains("Church")
                            ? Icons.church_outlined
                            : c.title.contains("Global")
                            ? Icons.public
                            : Icons.volunteer_activism_outlined,
                          backgroundColor: AppColors.primary2,
                          iconColor: AppColors.primary1,
                          ),
                        SizedBox(width: AppSize.widthPercent(0.035)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                c.title,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.038),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              Text(
                                c.subtitle,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.031),
                                  color: const Color(0xff686868),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              c.ytdAmount,
                              style: TextStyle(
                                fontFamily: "pb",
                                fontWeight: FontWeight.bold,
                                fontSize: AppSize.widthPercent(0.038),
                                color: AppColors.textcolor1,
                              ),
                            ),
                            Text(
                              "YTD",
                              style: TextStyle(
                                fontFamily: "pr",
                                fontSize: AppSize.widthPercent(0.026),
                                color: const Color(0xff686868),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// MAKE GENEROSITY BUTTON
              CustomButton(
                title: "+ Make Generosity",
                backgroundColor: const Color(0xff2D5C38),
                onTap: controller.makeGenerosity,
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// RECENT IMPACT SECTION
              Text(
                "Recent Impact",
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.048),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.015)),

              Container(
                padding: EdgeInsets.all(AppSize.widthPercent(0.045)),
                decoration: BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  color: const Color(0xffF4EFE6),
                  borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.06),
                  ),
                ),
                child: Column(
                  children: List.generate(controller.impacts.length, (index) {
                    final item = controller.impacts[index];
                    final isLast = index == controller.impacts.length - 1;

                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: AppSize.widthPercent(0.055),
                                width: AppSize.widthPercent(0.055),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: item.isCompleted
                                      ? const Color(0xff2D5C38)
                                      : const Color(0xffC2D3C0),
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: AppSize.widthPercent(0.035),
                                  color: Colors.white,
                                ),
                              ),
                              if (!isLast)
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    color: const Color(0xffC2D3C0),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(width: AppSize.widthPercent(0.035)),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: isLast
                                    ? 0
                                    : AppSize.heightPercent(0.025),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        item.date,
                                        style: TextStyle(
                                          fontFamily: "pr",
                                          fontSize: AppSize.widthPercent(0.028),
                                          color: const Color(0xff686868),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSize.heightPercent(0.003),
                                  ),
                                  Text(
                                    item.description,
                                    style: TextStyle(
                                      fontFamily: "pr",
                                      fontSize: AppSize.widthPercent(0.031),
                                      color: const Color(0xff686868),
                                    ),
                                  ),
                                  if (item.amount.isNotEmpty) ...[
                                    SizedBox(
                                      height: AppSize.heightPercent(0.003),
                                    ),
                                    Text(
                                      item.amount,
                                      style: TextStyle(
                                        fontFamily: "pb",
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppSize.widthPercent(0.035),
                                        color: AppColors.textcolor1,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
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