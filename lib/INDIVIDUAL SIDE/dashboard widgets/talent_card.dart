import 'package:flutter/material.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/dashboard%20widgets/talent_models.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/dashboard%20widgets/talent_style.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';

class TalentCard extends StatelessWidget {
  const TalentCard({
    super.key,
    required this.talent,
    required this.onTap,
    this.showArrow = true,
  });

  final Talent talent;
  final VoidCallback onTap;
  final bool showArrow;

  @override
  Widget build(BuildContext context) => Container(
    decoration: talentSurface(),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: talentSage,
                child: Icon(talent.icon, size: 21, color: FinanceColors.green),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      talent.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FinanceText.subheading(size: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      talent.activities.isEmpty
                          ? (talent.summary.isEmpty
                                ? talent.category
                                : talent.summary)
                          : talent.activities.first.title,
                      style: FinanceText.body(
                        color: FinanceColors.text,
                      ).copyWith(height: 1.25),
                    ),
                  ],
                ),
              ),
              if (showArrow)
                const Padding(
                  padding: EdgeInsets.only(left: 8, top: 12),
                  child: Icon(Icons.chevron_right, color: FinanceColors.green),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
