import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/learn_screen_items/quize_screen.dart';


import '../../intro_screens/quiz_screens.dart';

import '../../learn_screen_widgets/course_hero.dart';
import '../../learn_screen_widgets/course_info.dart';
import '../../learn_screen_widgets/course_lesson_tile.dart';
import '../../learn_screen_widgets/learn_button.dart';
import '../../learn_screen_widgets/learn_card.dart';
import '../../learn_screen_widgets/learn_progress_bar.dart';
import '../../learn_screen_widgets/learn_theme.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({
    super.key,
    this.onLessonTap,
  });

  final ValueChanged<int>? onLessonTap;

  void _openLesson(BuildContext context, int number) {
    // Continue button aur Lesson 4 dono quiz open karenge.
    if (number == 4) {
      Get.to(() => const FinancialTreasureQuizScreen());
      return;
    }

    if (onLessonTap != null) {
      onLessonTap!(number);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Lesson content is not available yet.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: learnBackground,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full-width header image.
              SizedBox(
                width: double.infinity,
                child: CourseHero(
                  onBack: () {
                    Navigator.maybePop(context);
                  },
                ),
              ),

              // Your Journey.
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
                child: LearnCard(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your Journey',
                                        style: learnText(
                                          12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '60% Complete',
                                        style: learnText(
                                          16,
                                          weight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFA8BFA1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '3 of 5 lessons',
                                    style: learnText(
                                      10,
                                      color: learnGreen,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const LearnProgressBar(
                              value: 0.60,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      LearnButton(
                        label: 'Continue Lesson 4',
                        onPressed: () => _openLesson(context, 4),
                      ),
                    ],
                  ),
                ),
              ),

              // About and curriculum.
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 46, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About This Course',
                      style: learnText(
                        16,
                        weight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      "An in-depth study of what it means to be a faithful "
                          "steward of God's resources. Discover practical, "
                          "biblically-grounded strategies for managing your "
                          "time, talents, and treasures with wisdom and purpose.",
                      style: learnText(12).copyWith(
                        height: 1.55,
                      ),
                    ),
                    const SizedBox(height: 24),

                    const Wrap(
                      spacing: 36,
                      runSpacing: 12,
                      children: [
                        CourseInfo(
                          icon: Icons.schedule,
                          label: '2.5 Hours',
                        ),
                        CourseInfo(
                          icon: Icons.menu_book_outlined,
                          label: '5 Lessons',
                        ),
                      ],
                    ),

                    const SizedBox(height: 44),

                    Text(
                      'Curriculum',
                      style: learnText(
                        16,
                        weight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 22),

                    CourseLessonTile(
                      number: 1,
                      title: 'The Foundation of Stewardship',
                      status: LessonStatus.completed,
                      onTap: () => _openLesson(context, 1),
                    ),

                    CourseLessonTile(
                      number: 2,
                      title: 'Managing Time',
                      status: LessonStatus.completed,
                      onTap: () => _openLesson(context, 2),
                    ),

                    CourseLessonTile(
                      number: 3,
                      title: 'The Gift of Talents',
                      status: LessonStatus.completed,
                      onTap: () => _openLesson(context, 3),
                    ),

                    CourseLessonTile(
                      number: 4,
                      title: 'Financial Treasure',
                      status: LessonStatus.current,
                      onTap: () => _openLesson(context, 4),
                    ),

                    const CourseLessonTile(
                      number: 5,
                      title: 'A Life of Service',
                      status: LessonStatus.locked,
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 24,
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