import 'package:flutter/material.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/dashboard%20widgets/talent_models.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/dashboard%20widgets/talent_style.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';


class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.activity});

  final TalentActivity activity;

  @override
  Widget build(BuildContext context) {
    final date = MaterialLocalizations.of(
      context,
    ).formatShortMonthDay(activity.date);
    final duration = activity.minutes % 60 == 0
        ? '${activity.minutes ~/ 60} hrs'
        : '${(activity.minutes / 60).toStringAsFixed(1)} hrs';
    return Container(
      decoration: talentSurface(),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: talentSage,
                child: Icon(
                  activity.modality == 'Reading'
                      ? Icons.menu_book_outlined
                      : Icons.handshake_outlined,
                  color: FinanceColors.green,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      style: FinanceText.subheading(size: 14),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 10,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: talentSage,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            activity.modality,
                            style: FinanceText.body(
                              size: 10,
                              color: FinanceColors.green,
                            ),
                          ),
                        ),
                        Text(
                          '$date  • $duration',
                          style: FinanceText.body(
                            size: 11,
                            color: FinanceColors.text,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (activity.reflection.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 34, top: 18),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: talentGoldFill,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.speaker_notes_outlined,
                      size: 14,
                      color: talentGoldInk,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '“${activity.reflection}”',
                        style: FinanceText.body(
                          size: 10,
                          color: talentGoldInk,
                        ).copyWith(height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
