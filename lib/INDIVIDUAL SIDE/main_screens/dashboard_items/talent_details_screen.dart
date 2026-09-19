import 'package:flutter/material.dart';
import '../../dashboard widgets/activity_card.dart';
import '../../dashboard widgets/talent_button.dart';
import '../../dashboard widgets/talent_models.dart';
import '../../dashboard widgets/talent_page.dart';
import '../../dashboard widgets/talent_style.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import 'add_development_activity_screen.dart';

class TalentDetailsScreen extends StatelessWidget {
  const TalentDetailsScreen({
    super.key,
    required this.controller,
    required this.talent,
  });

  final TalentsController controller;
  final Talent talent;

  @override
  Widget build(BuildContext context) {
    return TalentPage(
      title: 'Task Detail',
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 56),
        children: [
          Text(
            'Servant Leadership & Mentorship',
            style: FinanceText.heading(size: 16),
          ),
          const SizedBox(height: 6),
          Text(
            'Spiritual Growth',
            style: FinanceText.body(
              color: FinanceColors.text,
            ),
          ),
          const SizedBox(height: 22),

          // Hardcoded details.
          Container(
            decoration: talentSurface(),
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Details!',
                  style: FinanceText.body(
                    size: 10,
                    color: FinanceColors.text,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Read and meditate on Psalms 23. Reflect on '
                      'the concepts of stewardship, guidance, and '
                      'the Lord as a shepherd. Write down '
                      'three key takeaways in the journal.',
                  style: FinanceText.body(
                    color: FinanceColors.text,
                  ).copyWith(height: 1.45),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),

          Text(
            'Recent Activities',
            style: FinanceText.heading(size: 16),
          ),
          const SizedBox(height: 28),

          // First hardcoded activity.
          ActivityCard(
            activity: TalentActivity(
              title: 'Apprentice Coaching Session',
              modality: 'Practice',
              date: DateTime(2026, 10, 24),
              minutes: 90,
              reflection:
              'Discussed humility in team '
                  'discernment and intentional listening cues.',
            ),
          ),
          const SizedBox(height: 14),

          // Second hardcoded activity.
          ActivityCard(
            activity: TalentActivity(
              title: 'Servant Leadership',
              modality: 'Reading',
              date: DateTime(2026, 10, 24),
              minutes: 90,
            ),
          ),
          const SizedBox(height: 52),

          TalentButton(
            label: '+Add development Activity',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<TalentActivity>(
                  builder: (_) => AddDevelopmentActivityScreen(
                    controller: controller,
                    initialTalentId: talent.id,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}