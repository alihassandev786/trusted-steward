import 'package:flutter/material.dart';

import '../../dashboard widgets/guidance_action_tile.dart';
import '../../dashboard widgets/guidance_photo.dart';
import '../../dashboard widgets/stewardship_page.dart';
import '../../dashboard widgets/stewardship_style.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';

class GuidanceDetailScreen extends StatefulWidget {
  const GuidanceDetailScreen({
    super.key,
    this.image,
    this.onViewTasks,
    this.onReflect,
    this.onFeedback,
  });

  final ImageProvider? image;
  final VoidCallback? onViewTasks;
  final VoidCallback? onReflect;

  /// Receives 'helpful', 'unhelpful', or 'dismissed'.
  final ValueChanged<String>? onFeedback;

  @override
  State<GuidanceDetailScreen> createState() => _GuidanceDetailScreenState();
}

class _GuidanceDetailScreenState extends State<GuidanceDetailScreen> {
  String? _feedback;

  void _sheet(String title, String text) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: FinanceColors.background,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: FinanceText.heading()),
              const SizedBox(height: 16),
              Text(
                text,
                style: FinanceText.body(
                  color: FinanceColors.text,
                ).copyWith(height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => StewardshipPage(
    title: 'Guidance Detail',
    child: ListView(
      padding: const EdgeInsets.fromLTRB(20, 44, 20, 36),
      children: [
        Container(
          decoration: stewardshipSurface(),
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stewardship Reflection',
                style: FinanceText.body(size: 10, color: FinanceColors.text),
              ),
              const SizedBox(height: 20),
              Text(
                'Morning Quiet & Stewardship of Rest',
                style: FinanceText.subheading(size: 14),
              ),
              const SizedBox(height: 12),
              Text(
                'Generate Today at 8:00PM',
                style: FinanceText.body(size: 10, color: FinanceColors.text),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: stewardshipSurface(),
          padding: const EdgeInsets.fromLTRB(28, 32, 18, 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AI Recommendation!',
                      style: FinanceText.subheading(size: 14),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Taking 45 minutes of stillness before the morning rush. Realized that hurry is often the subtle enemy of faithful attention to Caleb and the team..\n\nWhen my schedule overflows without margin, my posture turns transactional rather than relational. Today, I commit to holding the 2:00 PM mentoring session unhurried, listening before offering counsel, and guarding the evening for family sabbath.....',
                      style: FinanceText.body(
                        color: FinanceColors.text,
                      ).copyWith(height: 1.4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 34),
              GuidancePhoto(
                image: widget.image ?? const AssetImage('assets/images/journel.png'),
                height: 168,
                detail: true,
              ),
              const SizedBox(height: 32),
              GuidanceActionTile(
                label: 'View Task Recommended by AI',
                onTap:
                    widget.onViewTasks ??
                    () => _sheet(
                      'Recommended tasks',
                      '• Set aside 45 minutes for morning stillness.\n• Protect the 2:00 PM mentoring session.\n• Listen before offering counsel.\n• Reserve the evening for family rest.',
                    ),
              ),
              const SizedBox(height: 10),
              GuidanceActionTile(
                label: 'Open Guided Reflection prompt',
                onTap:
                    widget.onReflect ??
                    () => _sheet(
                      'Guided reflection',
                      'Where has hurry made it harder for you to be present?\n\nWhat could you set aside today to make room for rest?\n\nHow can you give your full attention to someone who needs it?',
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 34),
        Center(
          child: Text(
            'Was This Guidance Helpful?',
            style: FinanceText.subheading(size: 14),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _feedbackButton(
              'helpful',
              'Helpful',
              Icons.thumb_up_alt_outlined,
              FinanceColors.green,
            ),
            const SizedBox(width: 12),
            _feedbackButton(
              'unhelpful',
              'Not helpful',
              Icons.thumb_down_alt_outlined,
              Colors.grey,
            ),
            const SizedBox(width: 12),
            _feedbackButton(
              'dismissed',
              'Dismiss feedback',
              Icons.close,
              FinanceColors.danger,
            ),
          ],
        ),
      ],
    ),
  );

  Widget _feedbackButton(
    String value,
    String label,
    IconData icon,
    Color color,
  ) {
    final selected = _feedback == value;

    final IconData displayIcon;
    if (selected && value == 'helpful') {
      displayIcon = Icons.thumb_up_alt;
    } else if (selected && value == 'unhelpful') {
      displayIcon = Icons.thumb_down_alt;
    } else {
      displayIcon = icon;
    }

    return Semantics(
      selected: selected,
      child: IconButton(
        tooltip: label,
        onPressed: () {
          if (value == 'dismissed') {
            Navigator.of(context).maybePop();
            return;
          }

          setState(() => _feedback = value);
          widget.onFeedback?.call(value);
        },
        style: IconButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          minimumSize: const Size(48, 48),
        ),
        icon: Icon(displayIcon, size: 24),
      ),
    );
  }
}
