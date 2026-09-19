import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../data/models/stewardship_models.dart';
import '../../../../data/models/stewardship_widgets.dart';

class GoalDetailsScreen extends StatefulWidget {
  const GoalDetailsScreen({
    super.key,
    this.goal,
    this.onComplete,
    this.firstImage = StewardAssets.first,
    this.secondImage = StewardAssets.second,
  });

  final SharedGoal? goal;
  final SaveGoal? onComplete;
  final ImageProvider firstImage;
  final ImageProvider secondImage;

  @override
  State<GoalDetailsScreen> createState() => _GoalDetailsScreenState();
}

class _GoalDetailsScreenState extends State<GoalDetailsScreen> {
  late SharedGoal _goal;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _goal = widget.goal ?? SharedGoal.example();
  }

  Future<void> _complete() async {
    setState(() => _busy = true);
    final completed = _goal.markComplete();
    try {
      await widget.onComplete?.call(completed);
      if (mounted) setState(() => _goal = completed);
    } catch (_) {
      if (mounted)
        stewardMessage(context, 'Could not complete goal. Please try again.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.light,
    child: Scaffold(
      backgroundColor: StewardStyle.bg,
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _cover(context),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    29,
                    20,
                    MediaQuery.paddingOf(context).bottom + 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: StewardStyle.box(),
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your goal Journey',
                                        style: StewardStyle.text(
                                          12,
                                          color: const Color(0xFF555555),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        '${(_goal.progress * 100).round()}% Complete',
                                        style: StewardStyle.heading(16),
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
                                    color: StewardStyle.badge,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    '${_goal.lessonsDone} of ${_goal.lessonCount} lessons',
                                    style: StewardStyle.text(
                                      10,
                                      color: StewardStyle.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: _goal.progress,
                                  minHeight: 7,
                                  color: StewardStyle.gold,
                                  backgroundColor: const Color(0xFF90908E),
                                ),
                              ),
                            ),
                            const SizedBox(height: 26),
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: _stat(
                                      'Logged',
                                      '${_goal.logged}',
                                      'Sessions',
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: _stat(
                                      'Target',
                                      '${_goal.target}',
                                      'Sessions',
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: _stat(
                                      'Remaining',
                                      '${_goal.remaining}',
                                      'To Goal',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 23),
                      AssignedCard(
                        assignedTo: _goal.assignedTo,
                        firstImage: widget.firstImage,
                        secondImage: widget.secondImage,
                      ),
                      const SizedBox(height: 23),
                      Text(
                        'Connected With Goal',
                        style: StewardStyle.heading(16),
                      ),
                      const SizedBox(height: 28),
                      if (widget.goal == null) ...[
                        _connected(
                          'Curriculum Prep',
                          'Oct 28, 4:00PM',
                          checked: true,
                        ),
                        const SizedBox(height: 12),
                        _connected(
                          'Lesson 3',
                          'The Gift of Talents',
                          checked: _goal.complete,
                        ),
                      ] else if (_goal.learnGoal.isNotEmpty)
                        _connected(
                          _goal.learnGoal,
                          _goal.category,
                          checked: _goal.complete,
                        )
                      else
                        Container(
                          width: double.infinity,
                          decoration: StewardStyle.box(),
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            'No connected lessons yet.',
                            style: StewardStyle.text(12),
                          ),
                        ),
                      const SizedBox(height: 55),
                      StewardButton(
                        label: _goal.complete ? 'Completed' : 'Mark Complete',
                        onPressed: _goal.complete ? null : _complete,
                        busy: _busy,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  Widget _cover(BuildContext context) {
    final remainingDays = _goal.dueDate.difference(DateTime.now()).inDays;
    final remainingLabel = widget.goal == null
        ? '8 weeks remaining'
        : _goal.complete
        ? 'Completed'
        : remainingDays < 0
        ? 'Past target date'
        : '${(remainingDays / 7).ceil()} weeks remaining';
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(68)),
      child: SizedBox(
        height: 302,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (_goal.coverImage != null)
              Image(
                image: _goal.coverImage!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _coverPlaceholder(),
              )
            else
              _coverPlaceholder(),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x30000000),
                    Color(0x18000000),
                    Color(0xD9000000),
                  ],
                  stops: [0, .35, 1],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: MediaQuery.paddingOf(context).top + 28,
              child: StewardBack(result: _goal),
            ),
            Positioned(
              left: 49,
              right: 25,
              bottom: 44,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: StewardStyle.green.withOpacity(.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _goal.category,
                      style: StewardStyle.text(
                        10,
                        color: const Color(0xFF88BD57),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _goal.title,
                    style: StewardStyle.text(
                      14,
                      bold: true,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Due ${MaterialLocalizations.of(context).formatMediumDate(_goal.dueDate)}.  $remainingLabel',
                    style: StewardStyle.text(12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _coverPlaceholder() =>  Container(
    color: Color(0xFF544126),
    child: Image.asset("assets/images/bible.png",fit: BoxFit.cover,)
  );

  Widget _stat(String label, String value, String unit) => Container(
    decoration: BoxDecoration(
      color: StewardStyle.paleGold,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: StewardStyle.text(10)),
        const SizedBox(height: 5),
        Text(
          value,
          style: StewardStyle.text(16, bold: true, color: StewardStyle.gold),
        ),
        const SizedBox(height: 2),
        Text(unit, style: StewardStyle.text(10)),
      ],
    ),
  );

  Widget _connected(String title, String subtitle, {required bool checked}) =>
      Container(
        decoration: StewardStyle.box(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: StewardStyle.iconFill,
              child: Icon(
                checked ? Icons.check_circle : Icons.circle_outlined,
                color: StewardStyle.green,
                size: 18,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: StewardStyle.text(14, bold: true)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: StewardStyle.text(12)),
                ],
              ),
            ),
            if (!checked) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: StewardStyle.paleGold,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Upcoming',
                  style: StewardStyle.text(10, color: StewardStyle.gold),
                ),
              ),
            ],
          ],
        ),
      );
}
