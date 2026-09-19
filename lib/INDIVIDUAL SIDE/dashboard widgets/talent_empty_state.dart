import 'package:flutter/material.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/dashboard%20widgets/talent_style.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';

class TalentEmptyState extends StatelessWidget {
  const TalentEmptyState({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    child: Column(
      children: [
        Image.asset("assets/images/pot.png",
        width: 50,height: 50,),
        const SizedBox(height: 24),
        Text(
          "You haven't added any talents yet",
          textAlign: TextAlign.center,
          style: FinanceText.subheading(
            size: 14,
            color: const Color(0xFF12243A),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Add an ability or area you want to develop. Each plan is held with open hands and intentional care.',
          textAlign: TextAlign.center,
          style: FinanceText.body(
            color: FinanceColors.text,
          ).copyWith(height: 1.4),
        ),
      ],
    ),
  );
}
