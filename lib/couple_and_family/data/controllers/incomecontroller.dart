import 'package:get/get.dart';

class IncomeCategoryData {
  final String title;
  final String amount;
  final double progress;

  IncomeCategoryData({
    required this.title,
    required this.amount,
    required this.progress,
  });
}

class DepositData {
  final String title;
  final String subtitle;
  final String amount;

  DepositData({
    required this.title,
    required this.subtitle,
    required this.amount,
  });
}

class IncomeController extends GetxController {
  static IncomeController get to => Get.find();

  final String title = "Income";
  final String totalIncome = "\$6,500";
  final String growth = "+5% from last month";

  final List<IncomeCategoryData> categories = [
    IncomeCategoryData(title: "Salary", amount: "\$5,000", progress: 0.8),
    IncomeCategoryData(title: "Freelance", amount: "\$1,200", progress: 0.6),
    IncomeCategoryData(title: "Other Income", amount: "\$320", progress: 0.95),
  ];

  final List<DepositData> recentDeposits = [
    DepositData(
      title: "TechCorp Inc.",
      subtitle: "Oct 15 . Direct Deposit",
      amount: "+\$450",
    ),
    DepositData(
      title: "Sarah Jenkins",
      subtitle: "Oct 12 . Venmo Transfer",
      amount: "+\$450",
    ),
    DepositData(
      title: "Yield Interest",
      subtitle: "Oct 24 . Hight Yield Savings",
      amount: "+\$12",
    ),
  ];

  void addIncome() {}
}