import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// =========================================================
/// CONTROLLER 1 — Used by "Treasure" screen
/// (Remaining to Allocate + Key Targets style screen)
/// =========================================================

class TargetItemData {
  final String title;
  final String trailingText;
  final double percent;

  TargetItemData({
    required this.title,
    required this.trailingText,
    required this.percent,
  });
}

class TreasureController extends GetxController {
  static TreasureController get to => Get.find<TreasureController>();

  final String pageTitle = "Treasure Dashboard";

  /// REMAINING TO ALLOCATE CARD
  final String allocateCardTitle = "Remaining to Allocate";
  final String sharedIncomeLabel = "Shared Income";
  final String sharedIncome = "\$6,500";
  final String sharedExpensesLabel = "Shared Expenses";
  final String sharedExpenses = "\$4,250";

  final String faithfulGivingLabel = "Faithful Giving";
  final String faithfulGiving = "\$850";
  final double faithfulGivingPercent = 0.3;

  final String currentSavingsLabel = "Current Savings";
  final String currentSavings = "\$1,400";

  /// ACTION BUTTONS
  final String sharedBudgetLabel = "Shared Budget";
  final IconData sharedBudgetIcon = Icons.people_alt_outlined;
  final String sharedGoalsLabel = "Shared Goals";
  final IconData sharedGoalsIcon = Icons.favorite_border_rounded;

  /// KEY TARGETS
  final String keyTargetsTitle = "Key Targets";

  final List<TargetItemData> keyTargets = [
    TargetItemData(
      title: "Giving",
      trailingText: "\$850 / \$850",
      percent: 1,
    ),
    TargetItemData(
      title: "Savings (15%)",
      trailingText: "\$1,000 / \$1,275",
      percent: 0.78,
    ),
  ];
}

/// =========================================================
/// CONTROLLER 2 — Used by "Ftreasure" screen
/// (September Budget + Categories style screen)
/// =========================================================

class CategoryItemData {
  final String title;
  final String trailingText;
  final double percent;

  CategoryItemData({
    required this.title,
    required this.trailingText,
    required this.percent,
  });
}

class ActionButtonItemData {
  final String label;
  final IconData icon;

  ActionButtonItemData({required this.label, required this.icon});
}

class Ftreasurecontroller extends GetxController {
  static Ftreasurecontroller get to => Get.find<Ftreasurecontroller>();

  final String pageTitle = "Household Overview";

  /// SEPTEMBER BUDGET CARD DATA
  final String budgetCardTitle = "September Budget";
  final String spentLabel = "Spent this month";
  final String spentAmount = "\$6,500";
  final String remainingLabel = "Remaining";
  final String remainingAmount = "\$4,250";
  final String startAmount = "\$0";
  final String totalBudgetAmount = "\$12,000";
  final double overallProgressPercent = 0.68;

  /// 2x2 ACTION BUTTONS DATA
  final List<ActionButtonItemData> actionButtons = [
    ActionButtonItemData(label: "Income", icon: Icons.south_west_rounded),
    ActionButtonItemData(label: "Expenses", icon: Icons.north_east_rounded),
    ActionButtonItemData(label: "Savings", icon: Icons.savings_outlined),
    ActionButtonItemData(label: "Giving", icon: Icons.favorite_rounded),
  ];

  /// CATEGORIES SECTION DATA
  final String categoriesTitle = "Categories";
  final String manageLabel = "Manage";

  final List<CategoryItemData> categories = [
    CategoryItemData(
      title: "Housing",
      trailingText: "\$2,350 of \$5,000",
      percent: 0.20,
    ),
    CategoryItemData(
      title: "Groceries",
      trailingText: "\$2,350 of \$5,000",
      percent: 0.75,
    ),
    CategoryItemData(
      title: "Transportation",
      trailingText: "\$2,350 of \$5,000",
      percent: 0.65,
    ),
    CategoryItemData(
      title: "Dining Out",
      trailingText: "\$2,350 of \$5,000",
      percent: 0.82,
    ),
  ];
}