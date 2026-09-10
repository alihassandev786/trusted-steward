import 'package:flutter/material.dart';
import '../../learn_screen_widgets/complete_course_screen_widgets.dart';
import '../../learn_screen_widgets/learn_theme.dart';

import '../../teasure_dasbord_widgets/detail_screen_header.dart';

class CompletedLearningScreen extends StatelessWidget {
  const CompletedLearningScreen({
    super.key,
    this.quizScore,
    this.totalQuestions = 10,
    this.onCourseTap,
  });

  final int? quizScore;
  final int totalQuestions;
  final ValueChanged<String>? onCourseTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              const DetailScreenHeader(
                title: 'Completed Learning',
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LearningMilestoneCard(
                      subtitle: quizScore == null
                          ? 'Milestone Achieved'
                          : 'Quiz completed: '
                          '$quizScore/$totalQuestions correct',
                      courses: 3,
                      lessons: 12,
                      hours: 3,
                    ),

                    const SizedBox(height: 28),

                    Text(
                      'Your Journey',
                      style: learnText(
                        16,
                        weight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 22),

                    CompletedCourseTile(
                      image: 'assets/images/learn1.jpg',
                      title: 'Principles of Peace',
                      subtitle: 'Completed Oct 12',
                      onTap: onCourseTap == null
                          ? null
                          : () => onCourseTap!(
                        'Principles of Peace',
                      ),
                    ),

                    CompletedCourseTile(
                      image: 'assets/images/bible.png',
                      title: 'Mindful Giving',
                      subtitle: 'Completed Oct 12',
                      onTap: onCourseTap == null
                          ? null
                          : () => onCourseTap!(
                        'Mindful Giving',
                      ),
                    ),

                    CompletedCourseTile(
                      image: 'assets/images/learn2.jpg',
                      title: 'Faithful Rhythms',
                      subtitle: 'Completed Oct 12',
                      onTap: onCourseTap == null
                          ? null
                          : () => onCourseTap!(
                        'Faithful Rhythms',
                      ),
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