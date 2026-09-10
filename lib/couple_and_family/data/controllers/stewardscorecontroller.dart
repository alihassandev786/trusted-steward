import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StewardStatData {
  final IconData icon;
  final String label;
  final double percent;
  StewardStatData({required this.icon, required this.label, required this.percent});
}

class StewardScoreController extends GetxController {
  static StewardScoreController get to => Get.find();

  final String pageTitle = "Couple  Stewardship Score";
  final int score = 903;
  final String scoreLabel = "Score";

  final String badgeTitle = "Balance Steward";
  final String badgeDescription =
      "You manage your resources well across all areas of life.";

  final List<StewardStatData> stats = [
    StewardStatData(icon: Icons.access_time_rounded, label: "Time", percent: 0.7),
    StewardStatData(icon: Icons.psychology_outlined, label: "Talents", percent: 0.55),
    StewardStatData(icon: Icons.credit_card_outlined, label: "Treasure", percent: 1),
  ];

  void continueTapped() {
    Get.back();
  }
}