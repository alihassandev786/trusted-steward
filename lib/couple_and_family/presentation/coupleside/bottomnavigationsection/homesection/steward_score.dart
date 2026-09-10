import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/CustomHeader.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/stewardscorecontroller.dart';
import '../../../Widgets/Button.dart';
import '../../../Widgets/Customtile.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';

class StewardScore extends StatelessWidget {
  const StewardScore({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StewardScoreController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              /// GREEN HEADER
              Container(
                width: double.infinity,
                height: AppSize.height*0.3,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.widthPercent(0.05),
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary1,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.widthPercent(0.18)),
                    bottomRight: Radius.circular(AppSize.widthPercent(0.18)),
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSize.heightPercent(0.015)),
                      CustomHeader(
                        title: "Couple stewardship Score",
                        showBackButton: true,
                        titleSize: AppSize.height * 0.019,
                      ),
                    ],
                  ),
                ),
              ),

              /// BODY
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.widthPercent(0.05),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: AppSize.widthPercent(0.25)),

                      Text(
                        controller.badgeTitle,
                        style: TextStyle(
                          fontFamily: "pb",
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.widthPercent(0.062),
                          color: AppColors.textcolor1,
                        ),
                      ),
                      SizedBox(height: AppSize.heightPercent(0.01)),
                      Text(
                        controller.badgeDescription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.039),
                          color: AppColors.textcolor2,
                          height: 1.3,
                        ),
                      ),

                      SizedBox(height: AppSize.heightPercent(0.03)),

                      ...controller.stats.map(
                        (stat) => Padding(
                          padding: EdgeInsets.only(
                            bottom: AppSize.heightPercent(0.012),
                          ),
                          child:
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.height * 0.03),
                              boxShadow: AppShadows.boxShadow,
                            ),
                            child: CustomTile(
                              height: AppSize.height * 0.083,
                              title: stat.label,
                              titleWeight: FontWeight.bold,
                              backgroundColor: AppColors.secondary1,
                              titleColor: AppColors.textcolor1,
                              leading: IconCircle(
                                icon: stat.icon,
                                iconColor: AppColors.primary1,
                                backgroundColor: AppColors.primary1,
                              ),
                              trailing: SizedBox(
                                width: AppSize.widthPercent(0.25),
                                height: AppSize.height*0.008,
                                child: _ProgressBar(
                                  percent: stat.percent,
                                  color: AppColors.warning,
                                ),
                              ),
                              borderRadius: AppSize.height*0.03,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: AppSize.heightPercent(0.02)),

                      CustomButton(
                        title: "Continue",
                        onTap: controller.continueTapped,
                      ),

                      SizedBox(height: AppSize.heightPercent(0.025)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// SCORE RING (OVERLAPPING HEADER)
          Positioned(
            top: AppSize.heightPercent(0.42) - AppSize.widthPercent(0.51),
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: AppSize.widthPercent(0.44),
                width: AppSize.widthPercent(0.44),
                decoration:  BoxDecoration(
                  boxShadow: AppShadows.boxShadow,
                  shape: BoxShape.circle,
                  color: AppColors.background,
                ),
                padding: EdgeInsets.all(AppSize.widthPercent(0.03)),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.warning,
                      width: AppSize.widthPercent(0.022),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${controller.score}",
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.1),
                            color: AppColors.warning,
                          ),
                        ),
                        Text(
                          controller.scoreLabel,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.042),
                            color: AppColors.textcolor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
