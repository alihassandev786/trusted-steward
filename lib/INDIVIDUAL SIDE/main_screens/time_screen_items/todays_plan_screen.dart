import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard widgets/app_palette.dart';
import '../../time_screen_widgets/plan_timeline_card.dart';
import '../../time_screen_widgets/task_item.dart';


/// IMPORTANT: this screen uses GetX (Get.to / Get.back) for navigation.
/// Make sure your app's root widget is `GetMaterialApp` (not `MaterialApp`),
/// and add `get: ^4.6.6` (or latest) to pubspec.yaml dependencies.
class TodaysPlanScreen extends StatelessWidget {
  const TodaysPlanScreen({super.key});

  static final List<TaskItem> _items = [
    const TaskItem(
      tag: 'Spiritual',
      tagIcon: Icons.wb_sunny_outlined,
      time: '6:30 AM',
      title: 'Morning Prayer',
      description: 'Start the day with quiet reflection, dedicating the hours ahead to...',
      category: 'Morning Prayer',
      status: 'Not Started',
      priority: 'Low Priority',
      detailsText:
      'Begin your day with a few quiet minutes of prayer. Dedicate the hours ahead to God and set your intentions for how you want to show up today.',
      whenText: 'Today - 6:30 AM',
      reminderText: '10 min before',
      journalSubtitle: 'Tap to start writing',
    ),
    const TaskItem(
      tag: 'Spiritual',
      tagIcon: Icons.menu_book_rounded,
      time: '7:00 AM',
      title: 'Scripture Reading',
      description: 'Continue reading through the Psalms. Focus on Psalm 119 on...',
      category: 'Scripture Study',
      status: 'In Progress',
      priority: 'High Priority',
      detailsText:
      'Read and meditate on Psalms 23. Reflect on the concepts of stewardship, guidance, and the Lord as a shepherd. Write down three key takeaways in the journal..',
      whenText: 'Today - 10:00 AM',
      reminderText: '15 min before',
      journalSubtitle: 'Tap to start writing',
    ),
    const TaskItem(
      tag: 'Spiritual',
      tagIcon: Icons.wb_sunny_outlined,
      time: '12:00 PM',
      title: 'Midday Movement',
      description: '30-minute brisk walk outdoors to clear the mid and maintain phys...',
      category: 'Midday Movement',
      status: 'Not Started',
      priority: 'High Priority',
      detailsText:
      'Step outside for a 30-minute brisk walk. Use the time to clear your mind, get some fresh air, and maintain physical wellbeing during your day.',
      whenText: 'Today - 12:00 PM',
      reminderText: '5 min before',
      journalSubtitle: 'Tap to start writing',
    ),
    const TaskItem(
      tag: 'Spiritual',
      tagIcon: Icons.nightlight_outlined,
      time: '9:00 PM',
      title: 'Evening Examen',
      description: 'Review the day with gratitude, noting moments of grace & ares...',
      category: 'Evening Examen',
      status: 'Not Started',
      priority: 'Low Priority',
      detailsText:
      'Review the day with gratitude. Note the moments of grace and the areas where you could grow, closing the day with a reflective heart.',
      whenText: 'Today - 9:00 PM',
      reminderText: '10 min before',
      journalSubtitle: 'Tap to start writing',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ─────────────────────────────────────────
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.green),
                      child: const Icon(Icons.chevron_left, color: Colors.white, size: 26),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Today's Plan",
                          style: TextStyle(fontSize: 19,fontFamily:"pops", fontWeight: FontWeight.w800, color: AppPalette.text),
                        ),
                        SizedBox(height: 2),
                        Text('Thursday, August 26', style: TextStyle(fontSize: 12.5, fontFamily:"popp",color: AppPalette.muted)),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 16, color: Colors.white),
                    label: const Text('New', style: TextStyle(fontSize: 13,fontFamily:"pop", fontWeight: FontWeight.w700, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPalette.green,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),

              // ── Timeline list ──────────────────────────────────
              for (int i = 0; i < _items.length; i++)
                PlanTimelineCard(item: _items[i], isLast: i == _items.length - 1),
            ],
          ),
        ),
      ),
    );
  }
}