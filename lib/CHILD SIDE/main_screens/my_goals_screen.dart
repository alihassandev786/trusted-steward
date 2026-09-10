import 'package:flutter/material.dart';

import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_card.dart';
import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';
import '../../INDIVIDUAL SIDE/teasure_dasbord_widgets/app_progress_bar.dart';
import '../../INDIVIDUAL SIDE/teasure_dasbord_widgets/detail_screen_header.dart';

class MyGoalsScreen extends StatelessWidget {
  const MyGoalsScreen({
    super.key,
    this.savingsImage = 'assets/images/goal1.png',
    this.readingImage = 'assets/images/goal2.png',
    this.musicImage = 'assets/images/goal3.png',
  });

  final String savingsImage;
  final String readingImage;
  final String musicImage;

  Widget _goalCard({
    required String image,
    required IconData fallbackIcon,
    required String category,
    required String title,
    required Widget progressLabel,
    required double progress,
  }) {
    return LearnCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 335 / 198,
            child: Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, error, stackTrace) {
                return Container(
                  color: learnIconBackground,
                  alignment: Alignment.center,
                  child: Icon(
                    fallbackIcon,
                    color: learnGreen,
                    size: 54,
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(26, 24, 20, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: learnText(
                    12,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  title,
                  style: learnText(
                    16,
                    weight: FontWeight.w600,
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: progressLabel,
                ),

                const SizedBox(height: 7),

                AppProgressBar(
                  value: progress,
                  height: 7,
                  activeColor: learnGold,
                  inactiveColor: const Color(0xFF8A8A8A),
                ),
              ],
            ),
          ),
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

              const DetailScreenHeader(
                title: 'My Goals',
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  children: [
                    _goalCard(
                      image: savingsImage,
                      fallbackIcon: Icons.savings_outlined,
                      category: 'Savings Goal',
                      title: 'Save for Stargazing..',
                      // Demo progress: target amount was not provided.
                      progress: 0.55,
                      progressLabel: Text.rich(
                        TextSpan(
                          style: learnText(
                            12,
                            color: Colors.black54,
                          ),
                          children: [
                            const TextSpan(text: 'Saved so far '),
                            TextSpan(
                              text: r'$32.00',
                              style: learnText(
                                12,
                                color: learnGreen,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),

                    const SizedBox(height: 18),

                    _goalCard(
                      image: readingImage,
                      fallbackIcon: Icons.menu_book_outlined,
                      category: 'Faith & Wisdom',
                      title: 'Read 10 Proverbs with Dad',
                      progress: 7 / 10,
                      progressLabel: Text(
                        '7 of 10 read',
                        style: learnText(
                          12,
                          color: Colors.black54,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    _goalCard(
                      image: musicImage,
                      fallbackIcon: Icons.music_note_outlined,
                      category: 'In Progress',
                      title: 'Learn 3 Worship Songs',
                      progress: 2 / 3,
                      progressLabel: Text(
                        '2 of 3 learned',
                        style: learnText(
                          12,
                          color: Colors.black54,
                        ),
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