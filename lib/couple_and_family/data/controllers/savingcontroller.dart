import 'package:get/get.dart';

class SavingsGoalData {
  final String category;
  final String title;
  final String savedAmount;
  final String targetAmount;
  final String estimatedDate;
  final String fundedPercentage;
  final double progress;

  SavingsGoalData({
    required this.category,
    required this.title,
    required this.savedAmount,
    required this.targetAmount,
    required this.estimatedDate,
    required this.fundedPercentage,
    required this.progress,
  });
}

class SavingsController extends GetxController {
  static SavingsController get to => Get.find();

  final String title = "Savings Goals";

  final List<SavingsGoalData> goals = [
    SavingsGoalData(
      category: "Mission Trip",
      title: "Family Mission Trip",
      savedAmount: "\$6,500",
      targetAmount: "of \$5,000",
      estimatedDate: "Est. Dec 2026",
      fundedPercentage: "40% Funded",
      progress: 0.75,
    ),
    SavingsGoalData(
      category: "Security",
      title: "Emergency Fund",
      savedAmount: "\$8,000",
      targetAmount: "of \$10,000",
      estimatedDate: "Est. Dec 2026",
      fundedPercentage: "80% Funded",
      progress: 0.8,
    ),
  ];

  void addFunds(SavingsGoalData goal) {}
  void createNewGoal() {}
}