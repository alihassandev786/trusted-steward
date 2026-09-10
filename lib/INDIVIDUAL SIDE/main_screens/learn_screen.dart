import 'package:flutter/material.dart';
import '../teasure_dasbord_widgets/finance_theme.dart';
import '../learn_screen_widgets/continue_lerning_card.dart';
import '../learn_screen_widgets/feature_series_card.dart';
import '../learn_screen_widgets/learn_list_tile.dart';
import '../learn_screen_widgets/learn_theme.dart';
import '../learn_screen_widgets/learning_overview_card.dart';
import 'learn_screen_items/course_detail_screen.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({
    super.key,
    this.onTopicTap,
    this.onSeriesTap,
    this.onReview,
    this.onNavigationTap,
    this.onLessonTap,
    this.showBottomNavigation = true,
  });

  final ValueChanged<String>? onTopicTap;
  final ValueChanged<String>? onSeriesTap;
  final ValueChanged<String>? onReview;
  final ValueChanged<int>? onNavigationTap;
  final ValueChanged<int>? onLessonTap;
  final bool showBottomNavigation;

  void _openCourse(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CourseDetailsScreen(
          onLessonTap: onLessonTap,
        ),
      ),
    );
  }

  Widget _heading(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 22),
      child: Text(
        title,
        style: learnText(16, weight: FontWeight.w700),
      ),
    );
  }

  Widget _topic(IconData icon, String title) {
    return LearnListTile(
      icon: icon,
      title: title,
      onTap: onTopicTap == null ? null : () => onTopicTap!(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
                child: Text(
                  'Learn Dashboard',
                  style: FinanceText.heading(size: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: LearningOverviewCard(),
              ),

              _heading('Continue Learning'),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ContinueLearningCard(
                  onContinue: () => _openCourse(context),
                ),
              ),

              _heading('Featured Series'),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FeaturedSeriesCard(
                      image: 'assets/images/learn1.jpg',
                      tag: 'New Release',
                      title: 'The Heart of Giving',
                      details: '4 Lessons - 45 mins',
                      onTap: onSeriesTap == null
                          ? null
                          : () => onSeriesTap!('The Heart of Giving'),
                    ),
                    const SizedBox(width: 16),
                    FeaturedSeriesCard(
                      image: 'assets/images/learn2.jpg',
                      tag: 'Popular',
                      title: 'Time for God',
                      details: '6 Lessons - 45 mins',
                      onTap: onSeriesTap == null
                          ? null
                          : () => onSeriesTap!('Time for God'),
                    ),
                  ],
                ),
              ),

              _heading('Browse Topics'),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _topic(
                      Icons.account_balance_outlined,
                      'Stewardship',
                    ),
                    _topic(
                      Icons.menu_book_outlined,
                      'Bible Studies',
                    ),
                    _topic(Icons.self_improvement, 'Prayer'),
                    _topic(Icons.schedule, 'Time'),
                    _topic(Icons.savings_outlined, 'Treasure'),
                    _topic(Icons.psychology_outlined, 'Talents'),
                    _topic(Icons.church_outlined, 'Faith'),
                  ],
                ),
              ),

              _heading('Completed'),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    LearnListTile(
                      icon: Icons.workspace_premium_outlined,
                      title: 'Principles of Peace',
                      subtitle: 'Completed Oct 22',
                      trailingLabel: 'Review',
                      onTap: onReview == null
                          ? null
                          : () => onReview!('Principles of Peace'),
                    ),
                    LearnListTile(
                      icon: Icons.workspace_premium_outlined,
                      title: 'Mindful Living',
                      subtitle: 'Completed Sep 20',
                      trailingLabel: 'Review',
                      onTap: onReview == null
                          ? null
                          : () => onReview!('Mindful Living'),
                    ),
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