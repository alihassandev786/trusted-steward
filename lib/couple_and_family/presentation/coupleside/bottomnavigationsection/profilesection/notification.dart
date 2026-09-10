import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/boxshadow.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/notificationcontroller.dart';
import '../../../Widgets/MediaqueryHelperfile.dart';




class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  final controller = Get.put(NotificationsController());
  late List<bool> _values;

  @override
  void initState() {
    super.initState();
    _values = controller.notifications.map((e) => e.initialValue).toList();
  }

  @override
  Widget build(BuildContext context) {
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
                      fontSize: AppSize.widthPercent(0.056),
                      color: AppColors.textcolor1,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.heightPercent(0.038)),

              /// NOTIFICATION TOGGLE LIST
              ...List.generate(controller.notifications.length, (index) {
                final item = controller.notifications[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: AppSize.heightPercent(0.01)),
                  child: _NotificationTile(
                    title: item.title,
                    subtitle: item.subtitle,
                    value: _values[index],
                    onChanged: (val) => setState(() => _values[index] = val),
                  ),
                );
              }),

              SizedBox(height: AppSize.heightPercent(0.02)),
            ],
          ),
        ),
      ),
    );
  }
}

/// NOTIFICATION TOGGLE TILE
class _NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NotificationTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: AppSize.widthPercent(0.045),
        horizontal: AppSize.widthPercent(0.05),
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary1,
        boxShadow: AppShadows.boxShadow,
        borderRadius: BorderRadius.circular(AppSize.widthPercent(0.07)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: AppSize.heightPercent(0.008)),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: "pr",
                    fontSize: AppSize.widthPercent(0.028),
                    color: AppColors.textcolor2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: AppSize.widthPercent(0.03)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: AppColors.primary1,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xff9E9E9E),
          ),
        ],
      ),
    );
  }
}