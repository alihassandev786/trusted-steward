import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';
import '../dashboard widgets/greeting_header.dart';
import '../dashboard widgets/insight_card.dart';
import '../dashboard widgets/learning_card.dart';
import '../dashboard widgets/resource_tile.dart';
import '../dashboard widgets/resources_section.dart';
import '../dashboard widgets/stewardship_score_card.dart';
import '../dashboard widgets/todays_plan_card.dart';
import '../dashboard widgets/verse_card.dart';


/// NOTE: Add these to your pubspec.yaml assets section:
///   assets:
///     - assets/images/avatar.png
///     - assets/images/bible.png
/// If the images are missing, each widget falls back to a placeholder icon
/// automatically (see errorBuilder in learning_card.dart / greeting_header.dart).
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
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
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
                description: 'You are making excellent progress across\nall areas of stewardship.',
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
              const Text("Today's Plan", style: AppTextStyles.heading),
              const SizedBox(height: 14),
              const TodaysPlanCard(
                items: [
                  PlanItem(title: 'Morning Player', time: '6:30 AM', done: true),
                  PlanItem(title: 'Bible Reading', time: '7:00 AM'),
                  PlanItem(title: 'Budget Review', time: '12:30 PM'),
                  PlanItem(title: 'Evening Reflection', time: '8:00 PM'),
                ],
              ),
              const SizedBox(height: 26),
              const VerseCard(
                verse:
                'Whatever you do, work at it with all your heart, as working for the Lord, not for human masters.',
                reflection:
                'Today, consider how your daily work is an act of worship. How can you approach your tasks with a renewed sense of purpose?',
              ),
              const SizedBox(height: 26),
              const Text('Stewardship Insight', style: AppTextStyles.heading),
              const SizedBox(height: 14),
              const InsightCard(
                icon: Icons.lightbulb_outline_rounded,
                title: 'Budget Alignment',
                description:
                "You have 15% of your 'Generosity' budget remaining this month. Consider reviewing your planned giving opportunities.",
              ),
              const SizedBox(height: 26),
              const Text('Continue Learning', style: AppTextStyles.heading),
              const SizedBox(height: 14),
              LearningCard(
                imageAsset: 'assets/images/bible.png',
                moduleLabel: 'Module 2',
                title: 'Biblical Stewardship 101',
                progress: 0.65,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}