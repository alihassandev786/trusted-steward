import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/dashboard_items/ask_stewardship_ai_screen.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/dashboard_items/stewardship_guidance_home.dart';

import '../../dashboard widgets/journel_wedgits.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import 'new_entry_screen.dart';

class EntryDetailsScreen extends StatelessWidget {
  const EntryDetailsScreen({
    super.key,
    this.title = 'Morning Quiet & Stewardship of Rest',
    this.category = 'Stewardship Reflection',
    this.date = 'Oct 12, 2026',
  });

  final String title;
  final String category;
  final String date;

  static const _description =
      'Taking 45 minutes of stillness before the morning rush. '
      'Realized that hurry is often the subtle enemy of faithful '
      'attention to Caleb and the team.\n\n'
      'When my schedule overflows without margin, my posture turns '
      'transactional rather than relational. Today, I commit to '
      'holding the 2:00 PM mentoring session unhurried, listening '
      'before offering counsel, and guarding the evening for '
      'family sabbath.';

  void _showAiPreview(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: journalCardColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reflection Prompt Preview',
                  style: FinanceText.heading(size: 18),
                ),
                const SizedBox(height: 16),
                Text(
                  'What is one practical way you can create space '
                      'for rest and attentive listening tomorrow?',
                  style: FinanceText.body(
                    size: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Sample prompt · AI is not connected yet.',
                  style: FinanceText.body(size: 11),
                ),
                const SizedBox(height: 24),
                JournalButton(
                  label: 'Close',
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _deletePreview(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: journalCardColor,
        title: const Text('Delete Entry?'),
        content: const Text(
          'This is a frontend preview. No stored entry will be deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (!context.mounted || confirmed != true) return;
    Navigator.maybePop(context);
  }

  @override
  Widget build(BuildContext context) {
    return JournalPage(
      title: 'Journal Entry',
      children: [
        const SizedBox(height: 34),
        JournalCard(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      category,
                      style: FinanceText.body(
                        size: 10,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const JournalPrivacyBadge(),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: FinanceText.subheading(size: 14),
              ),
              const SizedBox(height: 10),
              Text(
                date,
                style: FinanceText.body(
                  size: 10,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                '#Sabbath   #QuietHeart   #Time',
                style: FinanceText.body(
                  size: 10,
                  color: journalGold,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                _description,
                style: FinanceText.body(
                  size: 13,
                  color: Colors.black87,
                ).copyWith(height: 1.4),
              ),
              const SizedBox(height: 34),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                  height: 168,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const JournalPhoto(),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Color(0x99000000),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(
                            'Attached Photo',
                            style: FinanceText.body(
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: 20,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.wb_sunny_outlined,
                              size: 16,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                'Quiet morning study · Oct 24  '
                                    'Leica Q2 · 28mm',
                                style: FinanceText.body(
                                  size: 9,
                                  color: Colors.white,
                                ),
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
        const SizedBox(height: 22),
        JournalCard(
          padding: const EdgeInsets.fromLTRB(18, 30, 18, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stewardship Assistant',
                      style: FinanceText.subheading(size: 14),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      'Would you like AI-assisted reflection prompts '
                          'or related Scripture anchors based on this '
                          'entry? AI guidance is generated only upon '
                          'your direct request.',
                      style: FinanceText.body(
                        size: 13,
                        color: Colors.black87,
                      ).copyWith(height: 1.4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 38),
              JournalButton(
                label: 'Ask AI about this entry',
                icon: Icons.auto_awesome,
                onPressed: () {Get.to(()=>AskStewardshipAiScreen());},
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: JournalButton(
                label: 'Edit Entry',
                color: const Color(0xFFBDCFBD),
                textColor: journalGreen,
                onPressed: () {
                   Get.to(() => NewEntryScreen(
                        editing: true,
                        initialTitle: title,
                        initialDescription: _description,
                        initialCategory: category,
                      ),
                  );
                },
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: JournalButton(
                label: 'Delete Entry',
                color: const Color(0xFFEAB6B3),
                textColor: const Color(0xFFCC1717),
                onPressed: () => _deletePreview(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}