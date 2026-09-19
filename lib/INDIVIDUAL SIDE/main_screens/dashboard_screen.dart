import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/dashboard_items/journel_home_screen.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/dashboard_items/talents_dashboard_screen.dart';

import '../dashboard widgets/ai_support_guidence.dart';
import '../dashboard widgets/app_palette.dart';
import '../dashboard widgets/greeting_header.dart';
import '../dashboard widgets/insight_card.dart';
import '../dashboard widgets/learning_card.dart';
import '../dashboard widgets/my_talent_card.dart';
import '../dashboard widgets/resource_tile.dart';
import '../dashboard widgets/resources_section.dart';
import '../dashboard widgets/stewardship_score_card.dart';
import '../dashboard widgets/todays_plan_card.dart';
import '../dashboard widgets/journal_entry_card.dart';

import 'dashboard_items/stewardship_guidance_home.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
              GreetingHeader(
                name: 'Alex',
                date: 'Thursday, August 06',
                avatarAsset: 'assets/images/profile.png',
                onBellTap: () {},
              ),
              const SizedBox(height: 22),

              StewardshipScoreCard(
                score: 903,
                maxScore: 1000,
                title: 'Growing in Faithfulness',
                description:
                'You are making excellent progress across\n'
                    'all areas of stewardship.',
                onViewDetails: () {},
              ),
              const SizedBox(height: 26),

              const ResourcesSection(
                tiles: [
                  ResourceTile(
                    icon: Icons.access_time,
                    title: 'Time',
                    subtitle: '4/5 daily habits',
                    progress: 0.9,
                  ),
                  ResourceTile(
                    icon: Icons.psychology_outlined,
                    title: 'Talents',
                    subtitle: '2 skills growing',
                    progress: 0.5,
                  ),
                  ResourceTile(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'Treasure',
                    subtitle: 'On track',
                    progress: 1.0,
                  ),
                ],
              ),
              const SizedBox(height: 26),

              const Text(
                "Today's Plan",
                style: AppTextStyles.heading,
              ),
              const SizedBox(height: 14),
              const TodaysPlanCard(
                items: [
                  PlanItem(
                    title: 'Morning Prayer',
                    time: '6:30 AM',
                    done: true,
                  ),
                  PlanItem(
                    title: 'Bible Reading',
                    time: '7:00 AM',
                  ),
                  PlanItem(
                    title: 'Budget Review',
                    time: '12:30 PM',
                  ),
                  PlanItem(
                    title: 'Evening Reflection',
                    time: '8:00 PM',
                  ),
                ],
              ),
              const SizedBox(height: 26),

              AiSupportedGuidanceCard(
                onTap: () {
                  Get.to(()=>StewardshipGuidanceHome());
                },
              ),
              const SizedBox(height: 26),

              MyTalentsCard(
                onTap: () {
                 Get.to(()=>TalentsDashboardScreen());
                },
              ),
              const SizedBox(height: 26),

              const Text(
                'Stewardship Insight',
                style: AppTextStyles.heading,
              ),
              const SizedBox(height: 14),
              const InsightCard(
                icon: Icons.lightbulb_outline_rounded,
                title: 'Budget Alignment',
                description:
                "You have 15% of your 'Generosity' budget remaining "
                    'this month. Consider reviewing your planned '
                    'giving opportunities.',
              ),
              const SizedBox(height: 26),

              const Text(
                'Continue Learning',
                style: AppTextStyles.heading,
              ),
              const SizedBox(height: 14),
              LearningCard(
                imageAsset: 'assets/images/bible.png',
                moduleLabel: 'Module 2',
                title: 'Biblical Stewardship 101',
                progress: 0.65,
                onTap: () {},
              ),
              const SizedBox(height: 26),

              JournalEntryCard(
                onTap: () {
                 Get.to(()=>JournalHomeScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}