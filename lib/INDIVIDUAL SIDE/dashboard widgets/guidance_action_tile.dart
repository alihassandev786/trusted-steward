import 'package:flutter/material.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/dashboard%20widgets/stewardship_style.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';


class GuidanceActionTile extends StatelessWidget {
  const GuidanceActionTile({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Container(
    decoration: stewardshipSurface(radius: 23),
    child: Material(color: Colors.transparent, child: InkWell(
      borderRadius: BorderRadius.circular(23), onTap: onTap,
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        child: Row(children: [
          Expanded(child: Text(label, style: FinanceText.body(color: FinanceColors.text))),
          const SizedBox(width: 12),
          const Icon(Icons.chevron_right, color: FinanceColors.green, size: 22),
        ])),
    )),
  );
}
