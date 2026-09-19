import 'package:flutter/material.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';


/// Bottom-positioned panel that scrolls when the keyboard or large text needs space.
class TalentFormPanel extends StatelessWidget {
  const TalentFormPanel({super.key, required this.child, this.topGap = 80});

  final Widget child;
  final double topGap;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: constraints.maxHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom > 0
                  ? 12
                  : topGap,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 32),
              decoration: const BoxDecoration(
                color: FinanceColors.card,
                borderRadius: BorderRadius.vertical(top: Radius.circular(68)),
                border: Border.fromBorderSide(
                  BorderSide(color: FinanceColors.navBorder),
                ),
                boxShadow: [BoxShadow(color: Color(0x14000000), blurRadius: 4)],
              ),
              child: child,
            ),
          ],
        ),
      ),
    ),
  );
}
