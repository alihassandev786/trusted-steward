import 'package:get/get.dart';

class CategoryData {
  final String title;
  final String amount;
  final double progress; // 0.0 to 1.0

  CategoryData({
    required this.title,
    required this.amount,
    required this.progress,
  });
}

class TransactionData {
  final String title;
  final String subtitle;
  final String amount;

  TransactionData({
    required this.title,
    required this.subtitle,
    required this.amount,
  });
}

class ExpensesController extends GetxController {
  static ExpensesController get to => Get.find();

  final String title = "Expenses";
  final String spentAmount = "\$4,250";
  final String budgetAmount = "/ \$5,000 budget";

  final List<CategoryData> categories = [
    CategoryData(title: "Housing", amount: "\$1,800", progress: 0.8),
    CategoryData(title: "Food", amount: "\$650", progress: 0.6),
    CategoryData(title: "Utilities", amount: "\$320", progress: 0.95),
  ];

  final List<TransactionData> recentTransactions = [
    TransactionData(
      title: "Whole Foods Market",
      subtitle: "Today . Food",
      amount: "-\$450",
    ),
    TransactionData(
      title: "City Power & Light",
      subtitle: "Yesterday . Utilities",
      amount: "-\$450",
    ),
    TransactionData(
      title: "Chevron Station",
      subtitle: "Oct 24 . Transport",
      amount: "-\$450",
    ),
  ];

  void addExpense() {}
}