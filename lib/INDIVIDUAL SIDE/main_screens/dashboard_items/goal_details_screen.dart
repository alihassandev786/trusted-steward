import 'package:flutter/material.dart';

import '../../dashboard widgets/goal_assets.dart';
import '../../dashboard widgets/goal_button.dart';
import '../../dashboard widgets/goal_connection_tile.dart';
import '../../dashboard widgets/goal_cover.dart';
import '../../dashboard widgets/goal_models.dart';
import '../../dashboard widgets/goal_style.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';

class GoalDetailsScreen extends StatefulWidget {
  const GoalDetailsScreen({
    super.key,
    required this.controller,
    required this.goal,
  });

  // Kept so existing navigation continues to work.
  final GoalsController controller;
  final StewardshipGoal goal;

  @override
  State<GoalDetailsScreen> createState() => _GoalDetailsScreenState();
}

class _GoalDetailsScreenState extends State<GoalDetailsScreen> {
  bool _completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FinanceColors.background,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: ListView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 32,
            ),
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(68),
                ),
                child: SizedBox(
                  height: 302 +
                      (MediaQuery.textScalerOf(context).scale(14) - 14)
                          .clamp(0.0, 100.0)
                          .toDouble(),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Image path: assets/images/goal_bible.png
                      const GoalCover(
                        image: AssetImage(GoalAssets.bible),
                        height: 302,
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0x40000000),
                              Color(0xD9000000),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 24,
                        left: 20,
                        child: IconButton(
                          tooltip: 'Back',
                          onPressed: () => Navigator.of(context).maybePop(),
                          style: IconButton.styleFrom(
                            backgroundColor: FinanceColors.green,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(46, 46),
                          ),
                          icon: const Icon(Icons.chevron_left, size: 26),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        right: 24,
                        bottom: 44,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xAA526A34),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Faith',
                                style: FinanceText.body(
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Biblical Stewardship 101',
                              style: FinanceText.subheading(
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _completed
                                  ? 'Completed'
                                  : 'Due Dec 31, 2024.  8 weeks remaining',
                              style: FinanceText.body(
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _journeyCard(),
                    const SizedBox(height: 40),
                    Text(
                      'Connected With Goal',
                      style: FinanceText.heading(size: 16),
                    ),
                    const SizedBox(height: 22),
                    GoalConnectionTile(
                      connection: GoalConnection(
                        title: 'Mentoring Session',
                        subtitle: 'Oct 24, 2:00PM',
                        complete: true,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GoalConnectionTile(
                      connection: GoalConnection(
                        title: 'Curriculum Prep',
                        subtitle: 'Oct 28, 4:00PM',
                        complete: true,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GoalConnectionTile(
                      connection: GoalConnection(
                        title: 'Lesson 3',
                        subtitle: 'The Gift of Talents',
                        complete: _completed,
                      ),
                    ),
                    const SizedBox(height: 56),
                    GoalButton(
                      label: _completed ? 'Completed' : 'Mark Complete',
                      onPressed: _completed
                          ? null
                          : () {
                        setState(() => _completed = true);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _journeyCard() {
    return Container(
      decoration: goalSurface(),
      padding: const EdgeInsets.all(26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your goal Journey',
                      style: FinanceText.body(
                        color: const Color(0xFF555555),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _completed ? '100% Complete' : '60% Complete',
                      style: FinanceText.subheading(size: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFA7BFA1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _completed ? '5 of 5 lessons' : '3 of 5 lessons',
                  style: FinanceText.body(
                    size: 10,
                    color: FinanceColors.green,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: _completed ? 1.0 : 0.6,
              minHeight: 7,
              color: FinanceColors.gold,
              backgroundColor: const Color(0xFF8E8E8E),
            ),
          ),
          const SizedBox(height: 26),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _stat(
                  'Logged',
                  _completed ? '20' : '15',
                  'Sessions',
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _stat('Target', '20', 'Sessions'),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _stat(
                  'Remaining',
                  _completed ? '0' : '5',
                  'To Goal',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stat(String label, String value, String unit) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEEDDAD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: FinanceText.body(
              size: 10,
              color: FinanceColors.text,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: FinanceText.subheading(
              size: 16,
              color: FinanceColors.gold,
            ),
          ),
          Text(
            unit,
            style: FinanceText.body(
              size: 10,
              color: FinanceColors.text,
            ),
          ),
        ],
      ),
    );
  }
}