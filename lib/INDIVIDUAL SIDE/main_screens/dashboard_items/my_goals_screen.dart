import 'package:flutter/material.dart';
import '../../dashboard widgets/goal_button.dart';
import '../../dashboard widgets/goal_models.dart';
import '../../dashboard widgets/goal_page.dart';
import '../../dashboard widgets/my_goal_card.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import 'create_goal_screen.dart';
import 'goal_details_screen.dart';

class MyGoalsScreen extends StatefulWidget {
  const MyGoalsScreen({super.key, this.controller, this.onPickCover});

  final GoalsController? controller;
 final GoalCoverPicker? onPickCover;

  @override
  State<MyGoalsScreen> createState() => _MyGoalsScreenState();
}

class _MyGoalsScreenState extends State<MyGoalsScreen> {
  late GoalsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? GoalsController.demo();
  }

  @override
  void didUpdateWidget(covariant MyGoalsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      if (oldWidget.controller == null) _controller.dispose();
      _controller = widget.controller ?? GoalsController.demo();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GoalPage(
    title: 'My Goals',
    child: AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => ListView(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 48),
        children: [
          if (_controller.goals.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Text(
                'No goals yet. Create your first goal below.',
                style: FinanceText.body(color: FinanceColors.text),
              ),
            ),
          for (final goal in _controller.goals) ...[
            MyGoalCard(
              goal: goal,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) =>
                      GoalDetailsScreen(controller: _controller, goal: goal),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
          const SizedBox(height: 16),
          GoalButton(
            label: '+Create Goal',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<StewardshipGoal>(
                builder: (_) => CreateGoalScreen(
                  controller: _controller,
                  onPickCover: widget.onPickCover,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
