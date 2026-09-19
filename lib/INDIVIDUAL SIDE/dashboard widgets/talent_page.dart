import 'package:flutter/material.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';


class TalentPage extends StatelessWidget {
  const TalentPage({super.key, required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: FinanceColors.background,
    body: SafeArea(child: Center(child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: Column(children: [
        Padding(padding: const EdgeInsets.fromLTRB(20, 24, 20, 18),
          child: Row(children: [
            IconButton(tooltip: 'Back', onPressed: () => Navigator.of(context).maybePop(),
              style: IconButton.styleFrom(backgroundColor: FinanceColors.green,
                foregroundColor: Colors.white, minimumSize: const Size(46, 46)),
              icon: const Icon(Icons.chevron_left, size: 26)),
            const SizedBox(width: 16),
            Expanded(child: Text(title, style: FinanceText.heading())),
          ])),
        Expanded(child: child),
      ]),
    ))),
  );
}
