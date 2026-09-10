import 'package:get/get.dart';

class CommitmentData {
  final String title;
  final String subtitle;
  final String ytdAmount;

  CommitmentData({
    required this.title,
    required this.subtitle,
    required this.ytdAmount,
  });
}

class ImpactData {
  final String title;
  final String description;
  final String amount;
  final String date;
  final bool isCompleted;

  ImpactData({
    required this.title,
    required this.description,
    this.amount = "",
    required this.date,
    this.isCompleted = false,
  });
}

class GivingController extends GetxController {
  static GivingController get to => Get.find();

  final String totalGenerosity = "\$9,200";
  final String goalPercentage = "15% of income";
  final double goalProgress = 0.85;

  final List<CommitmentData> commitments = [
    CommitmentData(
      title: "Local Church Tithe",
      subtitle: "Automated. 10% Monthly",
      ytdAmount: "+\$450",
    ),
    CommitmentData(
      title: "Global Missions Fund",
      subtitle: "One time . Quarterly",
      ytdAmount: "+\$120",
    ),
    CommitmentData(
      title: "Food Bank Alliance",
      subtitle: "Automated . \$100/mo",
      ytdAmount: "+\$1,500",
    ),
  ];

  final List<ImpactData> impacts = [
    ImpactData(
      title: "Tithe Scheduled",
      description: "Processed successfully to Grace church.",
      amount: "\$550.0",
      date: "Nov 1",
      isCompleted: true,
    ),
    ImpactData(
      title: "Milestone Reached",
      description: "You surpassed \$1,000 in giving to World Mission this year",
      date: "Oct 12",
      isCompleted: false,
    ),
    ImpactData(
      title: "Food Bank Donation",
      description: "Automated monthly support.",
      amount: "\$100.0",
      date: "Nov 1",
      isCompleted: false,
    ),
  ];

  void manageCommitments() {}
  void makeGenerosity() {}
}