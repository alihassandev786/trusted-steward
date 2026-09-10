import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/completecourcescontroller.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';



class Completecourse extends StatefulWidget {
  const Completecourse({super.key});

  @override
  State<Completecourse> createState() => _CompletecourseState();
}

class _CompletecourseState extends State<Completecourse> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CompletedLearningController());

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

              SizedBox(height: AppSize.heightPercent(0.04)),

              /// MILESTONE CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.widthPercent(0.05),
                  vertical: AppSize.heightPercent(0.03),
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
                      children: [
                        IconCircle(
                          icon: Icons.workspace_premium_outlined,
                          iconColor: AppColors.primary1,
                          backgroundColor: AppColors.primary1,
                          height: AppSize.widthPercent(0.12),
                          width: AppSize.widthPercent(0.12),
                          iconSize: AppSize.widthPercent(0.06),
                        ),
                        SizedBox(width: AppSize.widthPercent(0.04)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.milestoneTitle,
                              style: TextStyle(
                                fontFamily: "pb",
                                fontWeight: FontWeight.bold,
                                fontSize: AppSize.widthPercent(0.045),
                                color: AppColors.textcolor1,
                              ),
                            ),
                            SizedBox(height: AppSize.heightPercent(0.003)),
                            Text(
                              controller.milestoneSubtitle,
                              style: TextStyle(
                                fontFamily: "pr",
                                fontSize: AppSize.widthPercent(0.034),
                                color: AppColors.textcolor2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.heightPercent(0.025)),
                    Divider(color: AppColors.textcolor2.withOpacity(0.25), thickness: 1),
                    SizedBox(height: AppSize.heightPercent(0.02)),

                    /// STATS ROW
                    Row(
                      children: [
                        Expanded(
                          child: _StatColumn(
                            label: controller.coursesLabel,
                            value: controller.coursesCount,
                          ),
                        ),
                        SizedBox(
                          height: AppSize.heightPercent(0.05),
                          child: VerticalDivider(
                            color: AppColors.textcolor2.withOpacity(0.25),
                            thickness: 1,
                            width: AppSize.widthPercent(0.06),
                          ),
                        ),
                        Expanded(
                          child: _StatColumn(
                            label: controller.lessonsLabel,
                            value: controller.lessonsCount,
                          ),
                        ),
                        SizedBox(
                          height: AppSize.heightPercent(0.05),
                          child: VerticalDivider(
                            color: AppColors.textcolor2.withOpacity(0.25),
                            thickness: 1,
                            width: AppSize.widthPercent(0.06),
                          ),
                        ),
                        Expanded(
                          child: _StatColumn(
                            label: controller.hoursLabel,
                            value: controller.hoursCount,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.04)),

              /// YOUR JOURNEY
              Text(
                controller.journeyTitle,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.05),
                  color: AppColors.textcolor1,
                ),
              ),
              SizedBox(height: AppSize.heightPercent(0.02)),

              ...controller.journey.map(
                    (course) => Padding(
                  padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.01)),
                  child: _JourneyTile(course: course),
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

/// MILESTONE STAT COLUMN
class _StatColumn extends StatelessWidget {
  final String label;
  final String value;

  const _StatColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: "pr",
            fontSize: AppSize.widthPercent(0.036),
            color: AppColors.textcolor2,
          ),
        ),
        SizedBox(height: AppSize.heightPercent(0.008)),
        Text(
          value,
          style: TextStyle(
            fontFamily: "pb",
            fontWeight: FontWeight.bold,
            fontSize: AppSize.widthPercent(0.052),
            color: AppColors.warning,
          ),
        ),
      ],
    );
  }
}

/// COMPLETED COURSE JOURNEY TILE
class _JourneyTile extends StatelessWidget {
  final CompletedCourseData course;

  const _JourneyTile({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppSize.widthPercent(0.03),horizontal: AppSize.widthPercent(0.02)),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.07)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSize.widthPercent(0.085),
            backgroundImage: AssetImage(course.image),
          ),
          SizedBox(width: AppSize.widthPercent(0.04)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: TextStyle(
                    fontFamily: "pb",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.widthPercent(0.04),
                    color: AppColors.textcolor1,
                  ),
                ),
                SizedBox(height: AppSize.heightPercent(0.005)),
                Text(
                  course.completedOn,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.032),
                    color: AppColors.textcolor2,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: AppColors.primary1,
            size: AppSize.widthPercent(0.09),
          ),
        ],
      ),
    );
  }
}