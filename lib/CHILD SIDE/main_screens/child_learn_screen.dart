import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../INDIVIDUAL SIDE/learn_screen_widgets/feature_series_card.dart';
import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_button.dart';
import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_card.dart';
import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_progress_bar.dart';
import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';
import 'learn_screen_items/course_detail_screen.dart';

class ChildLearnScreen extends StatelessWidget {
  const ChildLearnScreen({
    super.key,
    this.onStoryTap,
    this.onRecommendationTap,
    this.courseImage = 'assets/images/lren.png',
    this.detailImage = 'assets/images/childCourse.png',
  });

  final ValueChanged<String>? onStoryTap;
  final ValueChanged<String>? onRecommendationTap;

  final String courseImage;
  final String detailImage;

  void _openCourse() {
    Get.to(
          () => ChildCourseDetailsScreen(
        imageAsset: detailImage,
      ),
    );
  }

  void _openContent(
      BuildContext context,
      String title,
      ValueChanged<String>? callback,
      ) {
    if (callback != null) {
      callback(title);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title lesson is not connected yet.'),
      ),
    );
  }

  Widget _storyCard(
      BuildContext context, {
        required String image,
        required String title,
        required String subtitle,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => _openContent(context, title, onStoryTap),
        child: LearnCard(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 22,
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  image,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (_, error, stackTrace) {
                    return Container(
                      width: 40,
                      height: 40,
                      color: learnIconBackground,
                      child: const Icon(
                        Icons.menu_book,
                        color: learnGreen,
                        size: 22,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 14),
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
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: learnText(12),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 34),
                child: Text(
                  'Learn Dashboard',
                  style: learnText(
                    20,
                    weight: FontWeight.w800,
                  ),
                ),
              ),

              // Continue Learning
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LearnCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 335 / 198,
                        child: Image.asset(
                          courseImage,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, error, stackTrace) {
                            return const ColoredBox(
                              color: learnIconBackground,
                              child: Center(
                                child: Icon(
                                  Icons.menu_book,
                                  size: 54,
                                  color: learnGreen,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          20, 24, 16, 36,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                'Module 2',
                                style: learnText(
                                  12,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                'The Parable of the Talents',
                                style: learnText(
                                  16,
                                  weight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const SizedBox(width: 6),
                                const Expanded(
                                  child: LearnProgressBar(value: 0.65),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '65%',
                                  style: learnText(
                                    11,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 26),
                            LearnButton(
                              label: 'Continue Lesson',
                              onPressed: _openCourse,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
                child: Text(
                  'Bible Adventures Stories',
                  style: learnText(
                    16,
                    weight: FontWeight.w700,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _storyCard(
                      context,
                      image: 'assets/images/story1.png',
                      title: 'David the Giant of Fear',
                      subtitle: 'Discovering the faith',
                    ),
                    _storyCard(
                      context,
                      image: 'assets/images/story2.png',
                      title: 'Joseph the Faithful Planner',
                      subtitle: 'Learning to save..',
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 26),
                child: Text(
                  'Recommended For Us',
                  style: learnText(
                    16,
                    weight: FontWeight.w700,
                  ),
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FeaturedSeriesCard(
                      image: 'assets/images/recomended1.jpg',
                      tag: 'New Release',
                      title: '5 loaves 2 Fishes',
                      details: '10 min lesson',
                      onTap: () => _openContent(
                        context,
                        '5 loaves 2 Fishes Stories',
                        onRecommendationTap,
                      ),
                    ),
                    const SizedBox(width: 16),
                    FeaturedSeriesCard(
                      image: 'assets/images/recomended2.jpg',
                      tag: 'Popular',
                      title: 'Where does peace come from?',
                      details: '6 min lesson',
                      onTap: () => _openContent(
                        context,
                        'Where does peace come from?',
                        onRecommendationTap,
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