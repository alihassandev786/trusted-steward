import 'package:get/get.dart';

/// LESSON STATUS
enum LessonStatus { completed, current, locked }

/// CURRICULUM LESSON ITEM MODEL
class LessonItemData {
  final String title;
  final String subtitle;
  final LessonStatus status;

  LessonItemData({
    required this.title,
    required this.subtitle,
    required this.status,
  });
}

class CourseDetailsController extends GetxController {
  static CourseDetailsController get to => Get.find();

  /// BANNER SECTION
  final String bannerImage = "assets/images/coursedetail.png";
  final String levelTag = "Beginner";
  final String courseTitle = "Biblical Stewardship 101";
  final String instructor = "With Dr.James Arrington";

  /// YOUR JOURNEY CARD
  final String journeyTitle = "Your Journey";
  final String lessonsProgressLabel = "3 of 5 lessons";
  final String completePercentLabel = "60% Complete";
  final double completePercent = 0.6;
  final String continueLabel = "Continue Lesson 4";

  /// ABOUT THIS COURSE
  final String aboutTitle = "About This Course";
  final String aboutDescription =
      "An in-depth study of what it means to be a faithful steward of God's resources. Discover practical, biblically-grounded strategies for managing your time, talents, and treasures with wisdom and purpose.";
  final String duration = "2.5 Hours";
  final String lessonsCount = "5 Lessons";

  /// CURRICULUM
  final String curriculumTitle = "Curriculum";
  final List<LessonItemData> curriculum = [
    LessonItemData(
      title: "Lesson 1",
      subtitle: "The Foundation of Stewardship",
      status: LessonStatus.completed,
    ),
    LessonItemData(
      title: "Lesson 2",
      subtitle: "Managing Time",
      status: LessonStatus.completed,
    ),
    LessonItemData(
      title: "Lesson 3",
      subtitle: "The Gift of Tallents",
      status: LessonStatus.completed,
    ),
    LessonItemData(
      title: "Lesson 4",
      subtitle: "Financial Treasure",
      status: LessonStatus.current,
    ),
    LessonItemData(
      title: "Lesson 5",
      subtitle: "A Life of Service",
      status: LessonStatus.locked,
    ),
  ];
}