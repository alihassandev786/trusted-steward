import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_button.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_card.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';
import '../../../INDIVIDUAL SIDE/teasure_dasbord_widgets/app_progress_bar.dart';
import '../../../INDIVIDUAL SIDE/teasure_dasbord_widgets/detail_screen_header.dart';
import '../../../INDIVIDUAL SIDE/teasure_dasbord_widgets/summary_header_card.dart';
import 'add_talent_screen.dart';

class MyTalentsScreen extends StatefulWidget {
  const MyTalentsScreen({super.key});

  @override
  State<MyTalentsScreen> createState() => _MyTalentsScreenState();
}

class _MyTalentsScreenState extends State<MyTalentsScreen> {
  final List<Map<String, String>> _addedTalents = [];

  void _addTalent() {
    Get.to(() => AddTalentScreen());
  }


  Widget _talentCard({
    required IconData icon,
    required String title,
    required String subtitle,
    double? progress,
    String? goalLabel,
    String? completedLabel,
  }) {
    return LearnCard(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 22,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: learnIconBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: learnGreen,
                  size: 21,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: learnText(
                        14,
                        weight: FontWeight.w600,
                      ),
                    ),
                    if (subtitle.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: learnText(12).copyWith(height: 1.35),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (progress != null) ...[
            const SizedBox(height: 28),
            AppProgressBar(
              value: progress,
              height: 7,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    goalLabel ?? '',
                    style: learnText(
                      10,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  completedLabel ?? '',
                  style: learnText(10, color: learnGreen),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const DetailScreenHeader(title: 'My Talents'),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 36, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SummaryHeaderCard(
                      label: 'Little Piggy Bank',
                      amount: r'$4,250',
                      inlineSuffix: Text(
                        'total saved',
                        style: learnText(
                          12,
                          color: Colors.black54,
                        ),
                      ),
                      belowContent: Text(
                        'Available under your joyful stewardship.',
                        style: learnText(10),
                      ),
                    ),

                    const SizedBox(height: 34),

                    LearnButton(
                      label: '+ Add New Talent',
                      onPressed: _addTalent,
                    ),

                    const SizedBox(height: 34),

                    Text(
                      'Your Talents',
                      style: learnText(
                        16,
                        weight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 30),

                    _talentCard(
                      icon: Icons.palette_outlined,
                      title: 'Drawing & Creative Art',
                      subtitle:
                      'Make an encouraging drawing for grandparents',
                    ),

                    const SizedBox(height: 12),

                    _talentCard(
                      icon: Icons.piano_outlined,
                      title: 'Music & Piano',
                      subtitle: 'Beginner Keyboard',
                      progress: 1,
                      goalLabel: 'Monthly goal: 4 sessions',
                      completedLabel: '4/4 completed',
                    ),

                    const SizedBox(height: 12),

                    _talentCard(
                      icon: Icons.sports_soccer,
                      title: 'Soccer & Team Play',
                      subtitle: 'Show kindness and teamwork while playing',
                    ),

                    for (final talent in _addedTalents) ...[
                      const SizedBox(height: 12),
                      _talentCard(
                        icon: Icons.auto_awesome_outlined,
                        title: talent['title']!,
                        subtitle: talent['description']!,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}