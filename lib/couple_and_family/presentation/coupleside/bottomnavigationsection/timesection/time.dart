import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/time_screen_items/new_task_screen.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';
import '../../../Widgets/boxshadow.dart';
import '../../../Widgets/iconcircle.dart';
import 'new_task_screen.dart';

class Time extends StatefulWidget {
  const Time({super.key});
  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.widthPercent(0.05),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.heightPercent(0.02)),

                  /// TITLE
                  Text(
                    "Time Dashboard",
                    style: TextStyle(
                      fontFamily: "pops",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.06),
                      color: AppColors.textcolor1,
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.03)),

                  /// TODAY'S GRACE
                  Text(
                    "Today's Grace",
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.045),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.018)),

                  _GraceProgressCard(
                    icon: Icons.access_time_rounded,
                    title: "Tasks",
                    subtitle: "3/5",
                    percent: 3 / 5,
                  ),

                  SizedBox(height: AppSize.heightPercent(0.03)),

                  /// SHARED TASKS
                  Text(
                    "Shared Tasks",
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.045),
                      color: AppColors.textcolor1,
                    ),
                  ),
                  SizedBox(height: AppSize.heightPercent(0.018)),

                  /// TASK 1
                  _SharedTaskCard(
                    leading: IconCircle(
                      icon: Icons.person_outline_rounded,
                      iconColor: AppColors.primary1,
                      iconSize: AppSize.height * 0.02,
                      backgroundColor: AppColors.primary1,
                      height: AppSize.height * 0.036,
                      width: AppSize.height * 0.036,
                    ),
                    badgeText: "Assigned to Me",
                    categoryLabel: "House Hold",
                    title: "Pay Electricity Bill",
                    details: [
                      _DetailChip(
                        icon: Icons.access_time_rounded,
                        text: "Due today at 5:00 PM",
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.heightPercent(0.016)),

                  /// TASK 2
                  _SharedTaskCard(
                    leading: IconCircle(
                      icon: Icons.groups_outlined,
                      iconColor: AppColors.primary1,
                      iconSize: AppSize.height * 0.02,
                      backgroundColor: AppColors.primary1,
                      height: AppSize.height * 0.036,
                      width: AppSize.height * 0.036,
                    ),
                    badgeText: "Shared Task",
                    categoryLabel: "Stewardship",
                    title: "Church Small Group",
                    details: [
                      _DetailChip(
                        icon: Icons.location_on_outlined,
                        text: "Community Center",
                      ),
                      _DetailChip(
                        icon: Icons.access_time_rounded,
                        text: "7:00 PM - 9:00 PM",
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.heightPercent(0.016)),

                  /// TASK 3
                  _SharedTaskCard(
                    leading: CircleAvatar(
                      radius: AppSize.widthPercent(0.055),
                      backgroundImage: const AssetImage(
                        "assets/images/home1.png",
                      ),
                    ),
                    badgeText: "Assigned to Sarah",
                    categoryLabel: "House Hold",
                    title: "Family Grocery Run",
                    details: [
                      _DetailChip(
                        icon: Icons.shopping_cart_outlined,
                        text: "Whole Foods Market",
                      ),
                      _DetailChip(
                        icon: Icons.access_time_rounded,
                        text: "7:00 PM - 9:00 PM",
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.heightPercent(0.14)),
                ],
              ),
            ),

            /// FLOATING ADD TASK BUTTON

            // FloatingActionButton(
            //     onPressed:(){Get.to(()=>NewTaskScreen());},
            //     child: Positioned(
            //       right: AppSize.heightPercent(0.02),
            //       bottom: AppSize.heightPercent(0.02),
            //       child: IconCircle(
            //         icon: Icons.add,
            //         iconColor: Colors.white,
            //         backgroundColor: AppColors.primary1,
            //         opacity: 1,
            //         height: AppSize.widthPercent(0.14),
            //         width: AppSize.widthPercent(0.14),
            //         iconSize: AppSize.widthPercent(0.07),
            //
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endFloat,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CoupleNewTaskScreen());
        },
        backgroundColor: AppColors.primary1,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: AppSize.widthPercent(0.07),
        ),
      ),

    );
  }
}

/// "Today's Grace" progress summary card — icon + title/subtitle on the
/// left, a short progress bar on the right (e.g. Tasks 3/5).
class _GraceProgressCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double percent;

  const _GraceProgressCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSize.heightPercent(0.02),
        horizontal: AppSize.widthPercent(0.045),
      ),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.05)),
      ),
      child: Row(
        children: [
          IconCircle(
            icon: icon,
            iconColor: AppColors.primary1,
            backgroundColor: AppColors.primary1,
            height: AppSize.height * 0.042,
            width: AppSize.height * 0.042,
            iconSize: AppSize.widthPercent(0.05),
          ),
          SizedBox(width: AppSize.widthPercent(0.035)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: AppSize.heightPercent(0.004)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.033),
                    color: AppColors.textcolor2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: AppSize.widthPercent(0.03)),
          SizedBox(
            width: AppSize.widthPercent(0.22),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: percent,
                minHeight: AppSize.heightPercent(0.01),
                backgroundColor: const Color(0xffD9D9D9),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.warning),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Small icon + text pair used under a task title
/// (e.g. clock + "Due today at 5:00 PM").
class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _DetailChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppSize.widthPercent(0.035)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.textcolor2,
            size: AppSize.widthPercent(0.04),
          ),
          SizedBox(width: AppSize.widthPercent(0.012)),
          Text(
            text,
            style: TextStyle(
              fontFamily: "pr",
              fontSize: AppSize.widthPercent(0.03),
              color: AppColors.textcolor2,
            ),
          ),
        ],
      ),
    );
  }
}

/// "Shared Tasks" list card — leading avatar/icon, a rounded badge pill,
/// a category label on the right, a bold title, and one or more detail
/// chips (icon + text) below.
class _SharedTaskCard extends StatelessWidget {
  final Widget leading;
  final String badgeText;
  final String categoryLabel;
  final String title;
  final List<Widget> details;

  const _SharedTaskCard({
    required this.leading,
    required this.badgeText,
    required this.categoryLabel,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSize.widthPercent(0.045)),
      decoration: BoxDecoration(
        boxShadow: AppShadows.boxShadow,
        color: AppColors.secondary1,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              leading,
              SizedBox(width: AppSize.widthPercent(0.02)),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.widthPercent(0.028),
                    vertical: AppSize.heightPercent(0.007),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary2,
                    borderRadius: BorderRadius.circular(
                      AppSize.widthPercent(0.05),
                    ),
                  ),
                  child: Text(
                    badgeText,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "pm",
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.widthPercent(0.028),
                      color: AppColors.primary1,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                categoryLabel,
                style: TextStyle(
                  fontFamily: "pm",
                  fontWeight: FontWeight.w600,
                  fontSize: AppSize.widthPercent(0.03),
                  color: AppColors.primary1,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.heightPercent(0.016)),
          Text(
            title,
            style: TextStyle(
              fontFamily: "pb",
              fontWeight: FontWeight.bold,
              fontSize: AppSize.widthPercent(0.042),
              color: AppColors.textcolor1,
            ),
          ),
          SizedBox(height: AppSize.heightPercent(0.01)),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: AppSize.heightPercent(0.006),
            children: details,
          ),
        ],
      ),
    );
  }
}