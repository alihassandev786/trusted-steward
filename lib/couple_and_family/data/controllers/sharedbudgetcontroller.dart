import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// KEY TARGET ITEM MODEL
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

/// CATEGORY ITEM MODEL
class CategoryItemData {
  final IconData icon;
  final String title;
  final String amount;
  final String subText;
  final bool isAddCategory;
  CategoryItemData({
    required this.icon,
    required this.title,
    this.amount = "",
    this.subText = "",
    this.isAddCategory = false,
  });
}

/// RECENT SHARED TRANSACTION MODEL
class RecentSharedData {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  RecentSharedData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
  });
}

class SharedBudgetController extends GetxController {
  static SharedBudgetController get to => Get.find();

  /// HEADER
  final String pageTitle = "Shared Budget";

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

  /// KEY TARGETS
  final String keyTargetsTitle = "Key Targets";
  final List<TargetItemData> keyTargets = [
    TargetItemData(title: "Giving", trailingText: "\$850 / \$850", percent: 1),
    TargetItemData(
        title: "Savings (15%)", trailingText: "\$1,000 / \$1,275", percent: 0.78),
  ];

  /// CATEGORIES
  final String categoriesTitle = "Categories";
  final List<CategoryItemData> categories = [
    CategoryItemData(
      icon: Icons.home_outlined,
      title: "Housing",
      amount: "\$2,800",
      subText: "100% of \$2,800",
    ),
    CategoryItemData(
      icon: Icons.shopping_cart_outlined,
      title: "Groceries",
      amount: "\$650",
      subText: "80% of \$800",
    ),
    CategoryItemData(
      icon: Icons.bolt_outlined,
      title: "Utilities",
      amount: "\$320",
      subText: "64% of \$500",
    ),
    CategoryItemData(
      icon: Icons.add_rounded,
      title: "Add Category",
      isAddCategory: true,
    ),
  ];

  /// RECENT SHARED
  final String recentSharedTitle = "Recent Shared";
  final List<RecentSharedData> recentShared = [
    RecentSharedData(
      icon: Icons.storefront_outlined,
      title: "Whole Foods",
      subtitle: "Groceries",
      amount: "-\$95.2",
    ),
    RecentSharedData(
      icon: Icons.water_drop_outlined,
      title: "City Water Dept",
      subtitle: "Utilities",
      amount: "-\$95.2",
    ),
  ];
}