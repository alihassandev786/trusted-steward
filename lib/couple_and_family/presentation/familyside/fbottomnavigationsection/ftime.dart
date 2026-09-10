import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/appcolors.dart';
import '../../../data/controllers/ftimecontroller.dart';
import '../../Widgets/MediaqueryHelperfile.dart';
import '../../Widgets/boxshadow.dart';

class Ftime extends StatefulWidget {
  const Ftime({super.key});

  @override
  State<Ftime> createState() => _FtimeState();
}

class _FtimeState extends State<Ftime> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TimeController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.06)),
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
                  fontSize: AppSize.widthPercent(0.068),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.025)),

              /// SUBTITLE
              Text(
                controller.sharedTasksTitle,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.045),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.02)),

              /// DATE STRIP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.dates.map((item) {
                  return _DateItem(
                    day: item.day,
                    date: item.date,
                    selected: item.selected,
                  );
                }).toList(),
              ),

              SizedBox(height: AppSize.heightPercent(0.03)),

              /// FAMILY ALIGNMENT CARD
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.widthPercent(0.06),
                  vertical: AppSize.heightPercent(0.03),
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF4EFE6),
                    boxShadow: AppShadows.boxShadow,
                    borderRadius: BorderRadius.circular(
                    AppSize.widthPercent(0.06),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.alignmentTitle,
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.035),
                            color: const Color(0xff535353),
                          ),
                        ),
                        SizedBox(height: AppSize.heightPercent(0.006)),
                        Text(
                          controller.alignmentProgressText,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.045),
                            color: AppColors.textcolor1,
                          ),
                        ),
                        SizedBox(height: AppSize.heightPercent(0.015)),
                        Text(
                          controller.alignmentStatus,
                          style: TextStyle(
                            fontFamily: "pb",
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.widthPercent(0.03),
                            color: const Color(0xff6B6B6B),
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),

                    /// CIRCULAR PROGRESS INDICATOR
                    SizedBox(
                      height: AppSize.widthPercent(0.18),
                      width: AppSize.widthPercent(0.18),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: AppSize.widthPercent(0.18),
                            width: AppSize.widthPercent(0.18),
                            child: CircularProgressIndicator(
                              value: controller.alignmentPercent,
                              strokeWidth: AppSize.widthPercent(0.022),
                              backgroundColor: const Color(0xffE6D7B8),
                              valueColor:  AlwaysStoppedAnimation<Color>(
                                AppColors.warning,
                              ),
                            ),
                          ),
                          Text(
                            "${(controller.alignmentPercent * 100).toInt()}%",
                            style: TextStyle(
                              fontFamily: "pb",
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.widthPercent(0.036),
                              color: AppColors.warning,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.035)),

              /// MY FOCUS SECTION TITLE
              Text(
                controller.myFocusTitle,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.048),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.018)),

              /// MY FOCUS TASKS
              ...controller.focusTasks.map((task) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: AppSize.heightPercent(0.015),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.045),
                      vertical: AppSize.heightPercent(0.02),
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffF4EFE6),
                        boxShadow: AppShadows.boxShadow,
                        borderRadius: BorderRadius.circular(
                        AppSize.widthPercent(0.06),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: task.subtitle.isNotEmpty
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        _TaskCheckBox(isCompleted: task.isCompleted),
                        SizedBox(width: AppSize.widthPercent(0.04)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task.title,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.04),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              if (task.subtitle.isNotEmpty) ...[
                                SizedBox(height: AppSize.heightPercent(0.004)),
                                Text(
                                  task.subtitle,
                                  style: TextStyle(
                                    fontFamily: "pr",
                                    fontSize: AppSize.widthPercent(0.033),
                                    color: const Color(0xff686868),
                                  ),
                                ),
                              ],
                              if (task.badgeText.isNotEmpty) ...[
                                SizedBox(height: AppSize.heightPercent(0.012)),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppSize.widthPercent(0.035),
                                        vertical: AppSize.heightPercent(0.006),
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xff9FB098),
                boxShadow: AppShadows.boxShadow,
                borderRadius: BorderRadius.circular(
                                          AppSize.widthPercent(0.04),
                                        ),
                                      ),
                                      child: Text(
                                        task.badgeText,
                                        style: TextStyle(
                                          fontFamily: "pm",
                                          fontSize: AppSize.widthPercent(0.028),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: AppSize.widthPercent(0.03)),
                                    Text(
                                      task.timeText,
                                      style: TextStyle(
                                        fontFamily: "pr",
                                        fontSize: AppSize.widthPercent(0.03),
                                        color: const Color(0xff686868),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              SizedBox(height: AppSize.heightPercent(0.02)),

              /// SHARED STEWARDSHIP SECTION TITLE
              Text(
                controller.sharedStewardshipTitle,
                style: TextStyle(
                  fontFamily: "pb",
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.widthPercent(0.048),
                  color: AppColors.textcolor1,
                ),
              ),

              SizedBox(height: AppSize.heightPercent(0.018)),

              /// SHARED STEWARDSHIP TASKS
              ...controller.sharedTasks.map((sharedTask) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: AppSize.heightPercent(0.015),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.widthPercent(0.045),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TaskCheckBox(isCompleted: sharedTask.isCompleted),
                        SizedBox(width: AppSize.widthPercent(0.04)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sharedTask.title,
                                style: TextStyle(
                                  fontFamily: "pb",
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSize.widthPercent(0.04),
                                  color: AppColors.textcolor1,
                                ),
                              ),
                              SizedBox(height: AppSize.heightPercent(0.01)),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSize.widthPercent(0.025),
                                  vertical: AppSize.heightPercent(0.005),
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xff9FB098),
                                    boxShadow: AppShadows.boxShadow,
                                    borderRadius: BorderRadius.circular(
                                    AppSize.widthPercent(0.04),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: AppSize.widthPercent(0.025),
                                      backgroundImage: AssetImage(
                                        sharedTask.memberImage,
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppSize.widthPercent(0.018),
                                    ),
                                    Text(
                                      "${sharedTask.memberName} (${sharedTask.memberRole})",
                                      style: TextStyle(
                                        fontFamily: "pm",
                                        fontSize: AppSize.widthPercent(0.028),
                                        color: Colors.white,
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
                );
              }),

              SizedBox(height: AppSize.heightPercent(0.04)),
            ],
          ),
        ),
      ),
    );
  }
}

/// DATE ITEM WIDGET
class _DateItem extends StatelessWidget {
  final String day;
  final String date;
  final bool selected;

  const _DateItem({
    required this.day,
    required this.date,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthPercent(0.15),
      padding: EdgeInsets.symmetric(vertical: AppSize.heightPercent(0.01)),
      decoration: BoxDecoration(
          color: selected ? AppColors.primary1 : Colors.transparent,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.045)),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              fontFamily: "pr",
              fontSize: AppSize.widthPercent(0.03),
              color: selected ? Colors.white70 : const Color(0xff4A4A4A),
            ),
          ),
          SizedBox(height: AppSize.heightPercent(0.005)),
          Text(
            date,
            style: TextStyle(
              fontFamily: "pb",
              fontWeight: FontWeight.bold,
              fontSize: AppSize.widthPercent(0.052),
              color: selected ? Colors.white : AppColors.textcolor1,
            ),
          ),
        ],
      ),
    );
  }
}

/// CHECKBOX WIDGET
class _TaskCheckBox extends StatelessWidget {
  final bool isCompleted;

  const _TaskCheckBox({required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.widthPercent(0.068),
      width: AppSize.widthPercent(0.068),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCompleted ? const Color(0xff2D5C38) : Colors.transparent,
        border: Border.all(color: const Color(0xff2D5C38), width: 2),
      ),
      child: isCompleted
          ? Icon(
        Icons.check,
        size: AppSize.widthPercent(0.042),
        color: Colors.white,
      )
          : null,
    );
  }
}