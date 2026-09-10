import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/time_screen_items/time_stewardship_screen.dart';
import '../../dashboard widgets/app_palette.dart';
import '../../time_screen_widgets/app_header.dart';
import '../../time_screen_widgets/habit_card.dart';
import '../../time_screen_widgets/habit_icons.dart';


class DailyRhythmsScreen extends StatelessWidget {
  const DailyRhythmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(title: 'Daily Rhythms'),
              const SizedBox(height: 24),
              HabitCard(
                icon:  PrayerIcon(),
                title: 'Daily Prayer',
                subtitle: 'Morning & Evening',
                completedToday: true,
                streakDays: 14,onTap: (){Get.to(()=>TimeStewardshipScreen());},
                totalDots: 14,
                filledDots: 9,
                percent: 75,
              ),
              HabitCard(
                icon: const Icon(Icons.auto_stories_outlined,
                    color: AppPalette.green, size: 22),
                title: 'Bible Reading',
                subtitle: '1 Chapter / Day',
                completedToday: true,
                streakDays: 14,
                totalDots: 14,
                onTap: (){Get.to(()=>TimeStewardshipScreen());},
                filledDots: 10,
                percent: 85,
              ),
              HabitCard(
                icon:  SunDimIcon(),
                title: 'Midday Movement',
                subtitle: 'Morning & Evening',
                completedToday: true,
                streakDays: 14,onTap: (){Get.to(()=>TimeStewardshipScreen());},
                totalDots: 14,
                filledDots: 9,
                percent: 75,
              ),
            ],
          ),
        ),
      ),
    );
  }
}