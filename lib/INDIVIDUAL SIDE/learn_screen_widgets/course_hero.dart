import 'package:flutter/material.dart';
import 'learn_theme.dart';

class CourseHero extends StatelessWidget {
  const CourseHero({
    super.key,
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(65),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/bible.png',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),

            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x55000000),
                      Color(0x22000000),
                      Color(0xEE000000),
                    ],
                    stops: [0, 0.4, 1],
                  ),
                ),
              ),
            ),

            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 42),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Material(
                      color: const Color(0xFF195B37),
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      child: IconButton(
                        onPressed: onBack,
                        tooltip: 'Back',
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                    ),
                    const SizedBox(height: 52),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 29),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 17,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: learnGreen.withValues(alpha: 0.55),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Beginner',
                              style: learnText(
                                10,
                                color: const Color(0xFF8DCD71),
                              ),
                            ),
                          ),
                          const SizedBox(height: 17),
                          Text(
                            'Biblical Stewardship 101',
                            style: learnText(
                              14,
                              color: Colors.white,
                              weight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'With Dr. James Arrington',
                            style: learnText(
                              12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}