import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/time_screen_items/daily_rhythms_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/time_screen_items/new_task_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/time_screen_items/time_tracking_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/time_screen_items/todays_plan_screen.dart';
import '../dashboard widgets/app_palette.dart';
import '../time_screen_widgets/quick_action_button.dart';
import '../time_screen_widgets/schedule_preview_card.dart';
import '../time_screen_widgets/time_stat_tile.dart';
import '../time_screen_widgets/upcoming_task_tile.dart';

class TimeDashboardScreen extends StatefulWidget {
  const TimeDashboardScreen({super.key});

  @override
  State<TimeDashboardScreen> createState() => _TimeDashboardScreenState();
}

class _TimeDashboardScreenState extends State<TimeDashboardScreen> {
  int _navIndex = 1; // clock tab active, matching this screen
  bool _task1Done = false;
  bool _task2Done = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Time Dashboard', style: TextStyle(fontSize: 22, fontFamily:"pops",fontWeight: FontWeight.w800, color: AppPalette.text)),
                  const SizedBox(height: 20),

                  const Text("Today's Grace", style: AppTextStyles.heading),
                  const SizedBox(height: 14),
                  const TimeStatTile(icon: Icons.access_time, title: 'Tasks', subtitle: '3/5', progress: 0.6),
                  const SizedBox(height: 12),
                  const TimeStatTile(icon: Icons.self_improvement, title: 'Prayer', subtitle: '15m', progress: 0.65),
                  const SizedBox(height: 12),
                  const TimeStatTile(icon: Icons.menu_book, title: 'Reading', subtitle: 'Chap 4', progress: 1.0),
                  const SizedBox(height: 12),
                  const TimeStatTile(icon: Icons.spa_outlined, title: 'Habits', subtitle: '2/4', progress: 0.5),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuickActionButton(icon: Icons.add_task, label: 'New Task', onTap: () {Get.to(()=>TodaysPlanScreen());}),
                      QuickActionButton(icon: Icons.calendar_month_outlined, label: 'Calendar', onTap: () {Get.to(()=>TimeTrackingScreen());}),
                      QuickActionButton(icon: Icons.radar, label: 'Habits', onTap: () {Get.to(()=>NewTaskScreen());}),
                      QuickActionButton(icon: Icons.insights, label: 'Analytics', onTap: () {Get.to(()=>DailyRhythmsScreen());}),
                    ],
                  ),
                  const SizedBox(height: 28),

                  const Text('Schedule Preview', style: AppTextStyles.heading),
                  const SizedBox(height: 14),
                  const SchedulePreviewCard(items: [
                    ScheduleItem(
                      icon: Icons.wb_twilight_sharp,
                      title: 'Morning Devotion',
                      time: '8:00 AM',
                      note: 'Psalms 23 & Journaling',
                      active: true,
                    ),
                    ScheduleItem(
                      icon: Icons.work_outline_rounded,
                      title: 'Deep Work Block',
                      time: '10:00 AM',
                      note: 'Focus time for primary projects',
                    ),
                    ScheduleItem(
                      icon: Icons.restaurant_rounded,
                      title: 'Lunch & Rest',
                      time: '12:30 PM',
                      note: 'Psalms 23 & Journaling',
                    ),
                  ]),
                  const SizedBox(height: 28),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Upcoming Tasks', style: AppTextStyles.heading),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'See All',
                          style: TextStyle(fontSize: 13,fontFamily:"popp", fontWeight: FontWeight.w700, color: AppPalette.green),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  UpcomingTaskTile(
                    title: 'Prepare Sunday Lesson',
                    priority: TaskPriority.high,
                    due: 'Tomorrow',
                    checked: _task1Done,
                    onChanged: (v) => setState(() => _task1Done = v),
                  ),
                  const SizedBox(height: 12),
                  UpcomingTaskTile(
                    title: 'Review Monthly Budget',
                    priority: TaskPriority.medium,
                    due: 'Friday',
                    checked: _task2Done,
                    onChanged: (v) => setState(() => _task2Done = v),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}