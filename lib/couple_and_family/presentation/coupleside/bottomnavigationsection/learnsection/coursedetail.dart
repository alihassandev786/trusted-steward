import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/core/route/approutes.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/AppNavigator.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Button.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/coursedetailcontroller.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';


class Coursedetail extends StatefulWidget {
  const Coursedetail({super.key});

  @override
  State<Coursedetail> createState() => _CoursedetailState();
}

class _CoursedetailState extends State<Coursedetail> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CourseDetailsController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// BANNER IMAGE WITH OVERLAY CONTENT
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.widthPercent(0.08)),
                    bottomRight: Radius.circular(AppSize.widthPercent(0.08)),
                  ),
                  child: Image.asset(
                    controller.bannerImage,
                    height: AppSize.heightPercent(0.35),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: AppSize.height*0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSize.widthPercent(0.16)),
                      bottomRight: Radius.circular(AppSize.widthPercent(0.16)),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.35),
                        Colors.black.withOpacity(0.15),
                        Colors.black.withOpacity(0.75),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + AppSize.heightPercent(0.03),
                  left: AppSize.widthPercent(0.05),
                  child: CustomBackButton(),
                ),
                Positioned(
                  left: AppSize.widthPercent(0.09),
                  right: AppSize.widthPercent(0.05),
                  bottom: AppSize.heightPercent(0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.widthPercent(0.035),
                          vertical: AppSize.heightPercent(0.006),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary1.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(AppSize.widthPercent(0.05)),
                        ),
                        child: Text(
                          controller.levelTag,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.032),
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize.heightPercent(0.012)),
                      Text(
                        controller.courseTitle,
                        style: TextStyle(
                          fontFamily: "pb",
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.widthPercent(0.045),
                          color: AppColors.background,
                        ),
                      ),
                      SizedBox(height: AppSize.heightPercent(0.006)),
                      Text(
                        controller.instructor,
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.035),
                          color: AppColors.background,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.heightPercent(0.023)),

                  /// YOUR JOURNEY CARD
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.05),
                      vertical: AppSize.heightPercent(0.028),
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
                              controller.journeyTitle,
                              style: TextStyle(
                                fontFamily: "pr",
                                fontSize: AppSize.widthPercent(0.038),
                                color: AppColors.textcolor2,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSize.widthPercent(0.035),
                                vertical: AppSize.heightPercent(0.006),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary2,
                                borderRadius: BorderRadius.circular(AppSize.widthPercent(0.05)),
                              ),
                              child: Text(
                                controller.lessonsProgressLabel,
                                style: TextStyle(
                                  fontFamily: "pr",
                                  fontSize: AppSize.widthPercent(0.032),
                                  color: AppColors.primary1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.heightPercent(0.008)),
                        Text(
                          controller.completePercentLabel,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.05),
                            color: AppColors.textcolor1,
                          ),
                        ),
                        SizedBox(height: AppSize.heightPercent(0.02)),
                        _ProgressBar(percent: controller.completePercent, color: AppColors.warning),
                        SizedBox(height: AppSize.heightPercent(0.025)),
                        CustomButton(title: controller.continueLabel, onTap: (){
                          AppNavigator.pushRight(AppRoutes.quizquestiononboarding);
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.035)),

                  /// ABOUT THIS COURSE
                  Text(
                    controller.aboutTitle,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.045),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.015)),
                  Text(
                    controller.aboutDescription,
                    style: TextStyle(
                      fontFamily: "pr",
                      fontSize: AppSize.widthPercent(0.032),
                      color: AppColors.textcolor1,
                      height: 1.45,
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.025)),

                  /// STATS ROW
                  Row(
                    children: [
                      IconCircle(
                        icon: Icons.access_time_rounded,
                        iconColor: AppColors.primary1,
                        backgroundColor: AppColors.primary1,
                        height: AppSize.widthPercent(0.1),
                        width: AppSize.widthPercent(0.1),
                        iconSize: AppSize.widthPercent(0.048),
                      ),
                      SizedBox(width: AppSize.widthPercent(0.025)),
                      Text(
                        controller.duration,
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.04),
                          color: AppColors.textcolor1,
                        ),
                      ),
                      SizedBox(width: AppSize.widthPercent(0.06)),
                      IconCircle(
                        icon: Icons.menu_book_outlined,
                        iconColor: AppColors.primary1,
                        backgroundColor: AppColors.primary1,
                        height: AppSize.widthPercent(0.1),
                        width: AppSize.widthPercent(0.1),
                        iconSize: AppSize.widthPercent(0.048),
                      ),
                      SizedBox(width: AppSize.widthPercent(0.025)),
                      Text(
                        controller.lessonsCount,
                        style: TextStyle(
                          fontFamily: "pr",
                          fontSize: AppSize.widthPercent(0.04),
                          color: AppColors.textcolor1,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.heightPercent(0.035)),

                  /// CURRICULUM
                  Text(
                    controller.curriculumTitle,
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.05),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.02)),

                  ...controller.curriculum.map(
                        (lesson) => Padding(
                      padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.01)),
                      child: _LessonTile(lesson: lesson),
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.07)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// CURRICULUM LESSON TILE
class _LessonTile extends StatelessWidget {
  final LessonItemData lesson;

  const _LessonTile({required this.lesson});

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = lesson.status == LessonStatus.completed;
    final bool isCurrent = lesson.status == LessonStatus.current;
    final bool isLocked = lesson.status == LessonStatus.locked;

    final Color bgColor = isCurrent
        ? AppColors.primary1
        : isLocked
        ? const Color(0xffD9D9D9)
        : AppColors.secondary1;

    final Color titleColor = isCurrent
        ? Colors.white
        : isLocked
        ? const Color(0xff8A8A8A)
        : AppColors.textcolor1;

    final Color subtitleColor = isCurrent
        ? Colors.white70
        : isLocked
        ? const Color(0xff8A8A8A)
        : AppColors.textcolor2;

    final IconData iconData = isCompleted
        ? Icons.check_circle
        : isCurrent
        ? Icons.play_arrow_rounded
        : Icons.lock_outline_rounded;

    final Color iconCircleColor = isCurrent ? Color(0xff1B5934) : AppColors.primary1;
    final Color iconColor = isCurrent
        ? AppColors.background
        : isLocked
        ? const Color(0xff8A8A8A)
        : AppColors.primary1;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSize.widthPercent(0.05),
        horizontal: AppSize.widthPercent(0.05),
      ),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: bgColor,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.07)),
      ),
      child: Row(
        children: [
          IconCircle(
            icon: iconData,
            iconColor: iconColor,
            backgroundColor: iconCircleColor,
            opacity: isCurrent ? 1 : 0.15,
            height: AppSize.widthPercent(0.11),
            width: AppSize.widthPercent(0.11),
            iconSize: AppSize.widthPercent(0.05),
          ),
          SizedBox(width: AppSize.widthPercent(0.035)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson.title,
                  style: TextStyle(
                    fontFamily: "pb",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSize.widthPercent(0.042),
                    color: titleColor,
                  ),
                ),
                SizedBox(height: AppSize.heightPercent(0.004)),
                Text(
                  lesson.subtitle,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.035),
                    color: subtitleColor,
                  ),
                ),
              ],
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