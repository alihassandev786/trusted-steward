import 'package:flutter/material.dart';
import '../../dashboard widgets/question_input.dart';
import '../../dashboard widgets/scripture_card.dart';
import '../../dashboard widgets/stewardship_page.dart';
import '../../dashboard widgets/stewardship_style.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import 'ask_stewardship_ai_screen.dart';
import 'guidance_detail_screen.dart';


class StewardshipGuidanceHome extends StatelessWidget {
  const StewardshipGuidanceHome({
    super.key, this.reflectionImage, this.scriptureImage, this.onAsk,
  });
  final ImageProvider? reflectionImage;
  final ImageProvider? scriptureImage;
  final StewardshipAsk? onAsk;

  void _openChat(BuildContext context, String question) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) =>
      AskStewardshipAiScreen(initialQuestion: question, onAsk: onAsk)));
  }

  @override
  Widget build(BuildContext context) => StewardshipPage(

    title: 'Stewardship Guidance',
    child: ListView(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 48),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
          decoration: stewardshipSurface(color: stewardshipNotice),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Icon(Icons.shield_outlined, color: stewardshipInkGold, size: 18),
            const SizedBox(width: 10),
            Expanded(child: Text(stewardshipDisclaimer,
              style: FinanceText.body(color: stewardshipInkGold).copyWith(height: 1.25))),
          ]),
        ),
        const SizedBox(height: 36),
        QuestionInput(
          hint: 'Ask about time, scripture, or your goals..',
          onSubmit: (question) => _openChat(context, question),
        ),
        const SizedBox(height: 46),
        Text('Recommended Next Steps', style: FinanceText.heading(size: 16)),
        const SizedBox(height: 38),
        for (int index = 0; index < 3; index++) ...[
          ScriptureCard(
            showPhoto: index == 2,
            image: scriptureImage ?? const AssetImage('assets/images/ai.png'),
            onOpen: () => Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (_) => GuidanceDetailScreen(image: reflectionImage))),
          ),
          if (index < 2) const SizedBox(height: 16),
        ],
      ],
    ),
  );
}
