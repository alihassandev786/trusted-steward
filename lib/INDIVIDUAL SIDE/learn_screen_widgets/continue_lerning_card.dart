import 'package:flutter/material.dart';
import 'learn_asset_image.dart';
import 'learn_button.dart';
import 'learn_card.dart';
import 'learn_progress_bar.dart';
import 'learn_theme.dart';

class ContinueLearningCard extends StatelessWidget {
  const ContinueLearningCard({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return LearnCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LearnAssetImage(
            path: 'assets/images/bible.png',
            height: 184,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 23, 18, 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Module 2',
                  style: learnText(12, color: Colors.black54),
                ),
                const SizedBox(height: 5),
                Text(
                  'Biblical Stewardship 101',
                  style: learnText(15, weight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Expanded(
                      child: LearnProgressBar(value: 0.65),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '65%',
                      style: learnText(11, color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                LearnButton(
                  label: 'Continue Lesson',
                  onPressed: onContinue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}