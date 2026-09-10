import 'package:get/get.dart';

/// COMPLETED COURSE ITEM MODEL
class CompletedCourseData {
  final String image;
  final String title;
  final String completedOn;

  CompletedCourseData({
    required this.image,
    required this.title,
    required this.completedOn,
  });
}

class CompletedLearningController extends GetxController {
  static CompletedLearningController get to => Get.find();

  /// HEADER
  final String pageTitle = "Completed Learning";

  /// MILESTONE CARD
  final String milestoneTitle = "Wise Steward";
  final String milestoneSubtitle = "Milestone Achieved";
  final String coursesLabel = "Courses";
  final String coursesCount = "3";
  final String lessonsLabel = "Lessons";
  final String lessonsCount = "12";
  final String hoursLabel = "Hours";
  final String hoursCount = "3";

  /// YOUR JOURNEY
  final String journeyTitle = "Your Journey";
  final List<CompletedCourseData> journey = [
    CompletedCourseData(
      image: "assets/images/home1.png",
      title: "Principles of Peace",
      completedOn: "Completed Oct 12",
    ),
    CompletedCourseData(
      image: "assets/images/home1.png",
      title: "Mindful Giving",
      completedOn: "Completed Oct 12",
    ),
    CompletedCourseData(
      image: "assets/images/home1.png",
      title: "Faithful Rhythms",
      completedOn: "Completed Oct 12",
    ),
  ];
}