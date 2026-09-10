import 'package:get/get.dart';

/// NOTIFICATION ITEM MODEL
class NotificationItemData {
  final String title;
  final String subtitle;
  final bool initialValue;

  NotificationItemData({
    required this.title,
    required this.subtitle,
    required this.initialValue,
  });
}

class NotificationsController extends GetxController {
  static NotificationsController get to => Get.find();

  /// HEADER
  final String pageTitle = "Notifications";

  /// NOTIFICATION TOGGLES
  final List<NotificationItemData> notifications = [
    NotificationItemData(
      title: "Task Reminders",
      subtitle: "Stay on top of stewardship.",
      initialValue: true,
    ),
    NotificationItemData(
      title: "Daily Scripture",
      subtitle: "Receive a daily verse for reflection",
      initialValue: true,
    ),
    NotificationItemData(
      title: "Budget Alerts",
      subtitle: "When approcahing budget limits",
      initialValue: true,
    ),
    NotificationItemData(
      title: "Learning Notifications",
      subtitle: "Reminder to continue your stewardship",
      initialValue: false,
    ),
    NotificationItemData(
      title: "Goal Reminders",
      subtitle: "Update  on your saving and giving goals",
      initialValue: true,
    ),
    NotificationItemData(
      title: "AI Recommendations",
      subtitle: "Smart suggestions for resources.",
      initialValue: false,
    ),
    NotificationItemData(
      title: "Weekly Progress",
      subtitle: "A digest of your stewardship journey.",
      initialValue: true,
    ),
    NotificationItemData(
      title: "Goal Reminders",
      subtitle: "Update  on your saving and giving goals",
      initialValue: true,
    ),
  ];
}