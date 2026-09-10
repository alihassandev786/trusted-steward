import 'package:get/get.dart';

/// SHARED GOAL ITEM MODEL
class GoalItemData {
  final String imagePath;
  final String statusLabel; // e.g. "Target Dec 2026" or "Goal Reached"
  final String title;
  final String rightText; // e.g. "$4,000 of $10,000" / "15% Saved" / "July 2025"
  final double percent;
  final bool isCompleted;

  GoalItemData({
    required this.imagePath,
    required this.statusLabel,
    required this.title,
    required this.rightText,
    required this.percent,
    this.isCompleted = false,
  });
}

class SharedGoalsController extends GetxController {
  static SharedGoalsController get to => Get.find();

  /// HEADER
  final String pageTitle = "Shared Goals";

  /// GOALS LIST
  final List<GoalItemData> goals = [
    GoalItemData(
      imagePath: "assets/images/home2.png",
      statusLabel: "Target Dec 2026",
      title: "EmergencyFund",
      rightText: "\$4,000 of \$ 10,000",
      percent: 0.4,
    ),
    GoalItemData(
      imagePath: "assets/images/home2.png",
      statusLabel: "Target Aug 2026",
      title: "New Family Home",
      rightText: "15% Saved",
      percent: 0.15,
    ),
    GoalItemData(
      imagePath: "assets/images/home2.png",
      statusLabel: "Goal Reached",
      title: "Annual Mission Trip",
      rightText: "July 2025",
      percent: 1,
      isCompleted: true,
    ),
  ];
}