import 'package:flutter/material.dart';

import '../../../core/theme/appcolors.dart';
import '../../Widgets/MediaqueryHelperfile.dart';
import '../../Widgets/boxshadow.dart';
import '../../Widgets/iconcircle.dart';
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
              padding: EdgeInsets.symmetric(horizontal: AppSize.widthPercent(0.05)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.heightPercent(0.02)),

                  /// TITLE
                  Text(
                    "Time Dashboard",
                    style: TextStyle(
                      fontFamily: "pb",
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.widthPercent(0.055),
                      color: AppColors.textcolor1,
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.03)),

                      Text(
                        "Today's Shared Tasks",
                        style: TextStyle(
                          fontFamily: "pb",
                          fontWeight: FontWeight.bold,
                          fontSize: AppSize.widthPercent(0.038),
                          color: AppColors.textcolor1,
                        ),
                      ),


                  SizedBox(height: AppSize.heightPercent(0.04)),

                  /// DATE STRIP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _DateItem(day: "MON", date: "12", selected: false),
                      _DateItem(day: "TUE", date: "13", selected: true),
                      _DateItem(day: "WED", date: "14", selected: false),
                      _DateItem(day: "THU", date: "15", selected: false),
                      _DateItem(day: "FRI", date: "16", selected: false),
                    ],
                  ),

                  SizedBox(height: AppSize.heightPercent(0.04)),

                  /// TASK 1 - HIGH PRIORITY
                  _TaskCard(
                    leading: IconCircle(
                      icon: Icons.person_outline_rounded,
                      iconColor: AppColors.primary1,
                      iconSize: AppSize.height*0.02,
                      backgroundColor: AppColors.primary1,
                      height: AppSize.height*0.032,
                      width: AppSize.height*0.032,
                    ),
                    badgeText: "Assigned to Me",
                    priority: Row(
                      children: [
                        Icon(Icons.priority_high_rounded,
                            color: AppColors.error, size: AppSize.widthPercent(0.045)),
                        Text(
                          "High Priority",
                          style: TextStyle(
                            fontFamily: "pm",
                            fontWeight: FontWeight.w600,
                            fontSize: AppSize.widthPercent(0.025),
                            color: AppColors.error,
                          ),
                        ),
                      ],
                    ),
                    title: "Pay Electricity Bill",
                    subtitle: Row(
                      children: [
                        Icon(Icons.access_time_rounded,
                            color: AppColors.textcolor2, size: AppSize.widthPercent(0.04)),
                        SizedBox(width: AppSize.widthPercent(0.015)),
                        Text(
                          "Due today at 5:00 PM",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.03),
                            color: AppColors.textcolor2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.01)),

                  /// TASK 2 - SHARED TASK
                  _TaskCard(
                    leading: IconCircle(
                      icon: Icons.groups_outlined,
                      iconColor: AppColors.primary1,
                      iconSize: AppSize.height*0.02,
                      backgroundColor: AppColors.primary1,
                      height: AppSize.height*0.032,
                      width: AppSize.height*0.032,
                    ),
                    badgeText: "Shared Task",
                    priority: Text(
                      "Medium",
                      style: TextStyle(
                        fontFamily: "pm",
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.widthPercent(0.03),
                        color: AppColors.warning,
                      ),
                    ),
                    title: "Church Small Group",
                    subtitle: Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: AppColors.textcolor2, size: AppSize.widthPercent(0.04)),
                        SizedBox(width: AppSize.widthPercent(0.015)),
                        Text(
                          "Community Center",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.03),
                            color: AppColors.textcolor2,
                          ),
                        ),
                        SizedBox(width: AppSize.widthPercent(0.02)),
                        Icon(Icons.access_time_rounded,
                            color: AppColors.textcolor2, size: AppSize.widthPercent(0.04)),
                        SizedBox(width: AppSize.widthPercent(0.015)),
                        Text(
                          "7:00 PM - 9:00 PM",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.03),
                            color: AppColors.textcolor2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.01)),

                  /// TASK 3 - ASSIGNED TO SARAH
                  _TaskCard(
                    leading: CircleAvatar(
                      radius: AppSize.widthPercent(0.055),
                      backgroundImage: const AssetImage("assets/images/home1.png"),
                    ),
                    badgeText: "Assigned to Sarah",
                    priority: Text(
                      "Low",
                      style: TextStyle(
                        fontFamily: "pr",
                        fontSize: AppSize.widthPercent(0.03),
                        color: AppColors.textcolor2,
                      ),
                    ),
                    title: "Family Grocery Run",
                    subtitle: Row(
                      children: [
                        Icon(Icons.shopping_cart_outlined,
                            color: AppColors.textcolor2, size: AppSize.widthPercent(0.04)),
                        SizedBox(width: AppSize.widthPercent(0.015)),
                        Text(
                          "Whole Foods Market",
                          style: TextStyle(
                            fontFamily: "pr",
                            fontSize: AppSize.widthPercent(0.03),
                            color: AppColors.textcolor2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: AppSize.heightPercent(0.12)),
                ],
              ),
            ),

            /// FLOATING ADD TASK BUTTON
            Positioned(
              right: AppSize.heightPercent(0.02),
              bottom: AppSize.heightPercent(0.02),
              child: IconCircle(
                icon: Icons.add_task_rounded,
                iconColor: Colors.white,
                backgroundColor: AppColors.primary1,
                opacity: 1,
                height: AppSize.widthPercent(0.12),
                width: AppSize.widthPercent(0.12),
                iconSize: AppSize.widthPercent(0.06),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// DATE STRIP ITEM
class _DateItem extends StatelessWidget {
  final String day;
  final String date;
  final bool selected;

  const _DateItem({required this.day, required this.date, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.widthPercent(0.035),
        vertical: AppSize.heightPercent(0.005),
      ),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary1 : Colors.transparent,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.035)),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              fontFamily: "pr",
              fontSize: AppSize.widthPercent(0.028),
              color: selected ? Colors.white70 : AppColors.textcolor2,
            ),
          ),
          SizedBox(height: AppSize.heightPercent(0.005)),
          Text(
            date,
            style: TextStyle(
              fontFamily: "pb",
              fontWeight: FontWeight.bold,
              fontSize: AppSize.widthPercent(0.055),
              color: selected ? Colors.white : AppColors.textcolor1,
            ),
          ),
        ],
      ),
    );
  }
}

/// SHARED TASK CARD
class _TaskCard extends StatelessWidget {
  final Widget leading;
  final String badgeText;
  final Widget priority;
  final String title;
  final Widget subtitle;

  const _TaskCard({
    required this.leading,
    required this.badgeText,
    required this.priority,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height*0.175,
      width: double.infinity,
      padding: EdgeInsets.all(AppSize.widthPercent(0.05)),
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
              SizedBox(width: AppSize.widthPercent(0.015)),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.widthPercent(0.025),
                  vertical: AppSize.heightPercent(0.006),
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary2,
                  borderRadius: BorderRadius.circular(AppSize.widthPercent(0.05)),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    fontFamily: "pm",
                    fontWeight: FontWeight.w600,
                    fontSize: AppSize.widthPercent(0.025),
                    color: AppColors.primary1,
                  ),
                ),
              ),
              const Spacer(),
              priority,
            ],
          ),
          SizedBox(height: AppSize.heightPercent(0.016)),
          Text(
            title,
            style: TextStyle(
              fontFamily: "pb",
              fontWeight: FontWeight.bold,
              fontSize: AppSize.widthPercent(0.038),
              color: AppColors.textcolor1,
            ),
          ),
          SizedBox(height: AppSize.heightPercent(0.01)),
          subtitle,
        ],
      ),
    );
  }
}