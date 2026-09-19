import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/dashboard_items/my_goals_screen.dart';
import '../../dashboard widgets/goal_card.dart';
import '../../dashboard widgets/talent_assets.dart';
import '../../dashboard widgets/talent_card.dart';
import '../../dashboard widgets/talent_empty_state.dart';
import '../../dashboard widgets/talent_models.dart';

import '../../dashboard widgets/talent_page.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import 'my_talents_screen.dart';
import 'talent_details_screen.dart';
import 'add_development_activity_screen.dart';

class TalentsDashboardScreen extends StatefulWidget {
  const TalentsDashboardScreen({
    super.key,
    this.controller,
    this.firstGoalImage = TalentAssets.goalNativity,
    this.secondGoalImage = TalentAssets.goalWisdom,
  });

  final TalentsController? controller;
  final String firstGoalImage;
  final String secondGoalImage;

  @override
  State<TalentsDashboardScreen> createState() => _TalentsDashboardScreenState();
}

class _TalentsDashboardScreenState extends State<TalentsDashboardScreen> {
  late TalentsController _controller;
  final _goalsKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TalentsController.demo();
  }

  @override
  void didUpdateWidget(covariant TalentsDashboardScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      if (oldWidget.controller == null) _controller.dispose();
      _controller = widget.controller ?? TalentsController.demo();
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TalentPage(
    title: 'Talents Dashboard',
    child: AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => ListView(
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 48),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Your Talents',
                  style: FinanceText.heading(size: 16),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => MyTalentsScreen(controller: _controller),
                  ),
                ),
                child: Text(
                  'View All',
                  style: FinanceText.body(size: 11, color: FinanceColors.green),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          if (_controller.talents.isEmpty) const TalentEmptyState(),
          for (final talent in _controller.talents.take(3)) ...[
            TalentCard(
              talent: talent,
              showArrow: false,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => TalentDetailsScreen(
                    controller: _controller,
                    talent: talent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<TalentActivity>(
                builder: (_) =>
                    AddDevelopmentActivityScreen(controller: _controller),
              ),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: FinanceColors.green,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 124),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  const Icon(Icons.post_add_outlined, size: 28),
                  const SizedBox(height: 16),
                  Text(
                    'Add Activity',
                    style: FinanceText.subheading(
                      size: 14,
                      color: Colors.white,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Text('Your Goals', style: FinanceText.heading(size: 16)),
              ),
              TextButton(
                onPressed: () {
                  Get.to(()=>MyGoalsScreen());
                },
                child: Text(
                  'View All',
                  style: FinanceText.body(size: 11, color: FinanceColors.green),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Column(
            key: _goalsKey,
            children: [
              GoalCard(imagePath: widget.firstGoalImage),
              const SizedBox(height: 20),
              GoalCard(imagePath: widget.secondGoalImage),
            ],
          ),
        ],
      ),
    ),
  );
}
