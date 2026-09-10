import 'package:get/get.dart';

class DateItemData {
  final String day;
  final String date;
  final bool selected;

  DateItemData({required this.day, required this.date, this.selected = false});
}

class FocusTaskData {
  final String title;
  final String subtitle;
  final String badgeText;
  final String timeText;
  final bool isCompleted;

  FocusTaskData({
    required this.title,
    this.subtitle = "",
    this.badgeText = "",
    this.timeText = "",
    this.isCompleted = false,
  });
}

class SharedStewardshipTaskData {
  final String title;
  final String memberName;
  final String memberRole;
  final String memberImage;
  final bool isCompleted;

  SharedStewardshipTaskData({
    required this.title,
    required this.memberName,
    required this.memberRole,
    required this.memberImage,
    this.isCompleted = false,
  });
}

class TimeController extends GetxController {
  static TimeController get to => Get.find();

  final String pageTitle = "Time Dashboard";
  final String sharedTasksTitle = "Today's Shared Tasks";

  /// DATE STRIP
  final List<DateItemData> dates = [
    DateItemData(day: "MON", date: "12"),
    DateItemData(day: "TUE", date: "13", selected: true),
    DateItemData(day: "WED", date: "14"),
    DateItemData(day: "THU", date: "15"),
    DateItemData(day: "FRI", date: "16"),
  ];

  /// FAMILY ALIGNMENT CARD
  final String alignmentTitle = "Family Alignment";
  final String alignmentProgressText = "6 of 8 Tasks";
  final String alignmentStatus = "ON TRACK";
  final double alignmentPercent = 0.75; // 75%

  /// MY FOCUS SECTION
  final String myFocusTitle = "My Focus";
  final List<FocusTaskData> focusTasks = [
    FocusTaskData(
      title: "Review Q3 Endowment",
      subtitle: "Prepare notes for quarterly advisor",
      badgeText: "Personal",
      timeText: "10:00 AM",
      isCompleted: false,
    ),
    FocusTaskData(title: "Approve Monthly Allowance", isCompleted: true),
  ];

  /// SHARED STEWARDSHIP SECTION
  final String sharedStewardshipTitle = "Shared Stewardship";
  final List<SharedStewardshipTaskData> sharedTasks = [
    SharedStewardshipTaskData(
      title: "Clean Room & Organized Desk",
      memberName: "EMMA",
      memberRole: "Junior",
      memberImage: "assets/images/home1.png",
      isCompleted: false,
    ),
    SharedStewardshipTaskData(
      title: "Church Committee Meeting",
      memberName: "SARAH",
      memberRole: "Guardian",
      memberImage: "assets/images/home1.png",
      isCompleted: false,
    ),
  ];
}