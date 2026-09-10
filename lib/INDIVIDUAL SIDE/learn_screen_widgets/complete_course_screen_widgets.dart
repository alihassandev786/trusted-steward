import 'package:flutter/material.dart';
import 'learn_asset_image.dart';
import 'learn_card.dart';
import 'learn_theme.dart';

// ── Milestone summary ──

class LearningMilestoneCard extends StatelessWidget {
  const LearningMilestoneCard({
    super.key,
    this.title = 'Wise Steward',
    this.subtitle = 'Milestone Achieved',
    this.courses = 3,
    this.lessons = 12,
    this.hours = 3,
  });

  final String title;
  final String subtitle;
  final int courses;
  final int lessons;
  final int hours;

  @override
  Widget build(BuildContext context) {
    return LearnCard(
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: learnIconBackground,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.workspace_premium,
                    color: learnGreen,
                    size: 21,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: learnText(
                          16,
                          weight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 3),
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
          const SizedBox(height: 26),
          const Divider(
            height: 1,
            color: Color(0xFFE3DFD2),
          ),
          const SizedBox(height: 18),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _MilestoneStat(
                    label: 'Courses',
                    value: courses,
                  ),
                ),
                const VerticalDivider(
                  width: 1,
                  color: Color(0xFFE3DFD2),
                ),
                Expanded(
                  child: _MilestoneStat(
                    label: 'Lessons',
                    value: lessons,
                  ),
                ),
                const VerticalDivider(
                  width: 1,
                  color: Color(0xFFE3DFD2),
                ),
                Expanded(
                  child: _MilestoneStat(
                    label: 'Hours',
                    value: hours,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MilestoneStat extends StatelessWidget {
  const _MilestoneStat({
    required this.label,
    required this.value,
  });

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            label,
            style: learnText(
              12,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$value',
            style: learnText(
              14,
              color: learnGold,
              weight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Completed course row ──

class CompletedCourseTile extends StatelessWidget {
  const CompletedCourseTile({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String image;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: LearnCard(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 13,
          ),
          child: Row(
            children: [
              ClipOval(
                child: SizedBox(
                  width: 58,
                  height: 58,
                  child: LearnAssetImage(
                    path: image,
                    height: 58,
                  ),
                ),
              ),
              const SizedBox(width: 28),
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
              const SizedBox(width: 8),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.chevron_right,
                  color: learnGreen,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}