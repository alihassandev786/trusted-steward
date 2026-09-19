import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/treasure_dashboard_screen_items/new_goals_screen.dart';
import 'package:trusted_steward/couple_and_family/presentation/Widgets/Backbutton.dart';
import 'package:trusted_steward/couple_and_family/presentation/coupleside/bottomnavigationsection/treasuresection/create_goal_screen.dart';
import 'package:trusted_steward/couple_and_family/presentation/coupleside/bottomnavigationsection/treasuresection/goal_details_screen.dart';

import '../../../../core/theme/appcolors.dart';
import '../../../../data/controllers/sharedgoalscontroller.dart';

// Replace your existing screen at its current location to preserve imports.
// Wire onAddGoal to your existing create-goal route.
// Images and labels come from SharedGoalsController.goals.
class Sharedgoals extends StatefulWidget {
  const Sharedgoals({super.key, required this.onAddGoal});
  final VoidCallback onAddGoal;

  @override
  State<Sharedgoals> createState() => _SharedgoalsState();
}

class _SharedgoalsState extends State<Sharedgoals> {
  late final SharedGoalsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.isRegistered<SharedGoalsController>()
        ? Get.find<SharedGoalsController>()
        : Get.put(SharedGoalsController());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.background,
    body: SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: GetBuilder<SharedGoalsController>(
            init: controller,
            autoRemove: false,
            builder: (controller) => ListView(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 58),
              children: [
                Row(children: [
                  SizedBox(width: 45, height: 45, child: CustomBackButton()),
                  const SizedBox(width: 16),
                  Expanded(child: Text(controller.pageTitle,
                      style: _text(21, bold: true))),
                  const SizedBox(width: 8),
                  SizedBox(width: 45, height: 45, child: Material(
                      color: AppColors.primary1,
                      shape: const CircleBorder(),
                      child: IconButton(
                        tooltip: 'Add goal',
                        onPressed: (){
                          Get.to(()=>CreateGoalScreen());
                        },
                        icon: const Icon(Icons.add, color: Colors.white, size: 28),
                      ),
                    )),
                ]),
                const SizedBox(height: 34),
                for (final goal in controller.goals)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: _GoalCard(goal: goal),
                  ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.goal});
  final GoalItemData goal;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.secondary1,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: AppColors.textcolor1.withOpacity(0.08)),
      boxShadow: const [BoxShadow(
        color: Color(0x18000000), blurRadius: 3, spreadRadius: 0.5,
      )],
    ),
    child: GestureDetector(
      onTap: (){Get.to(()=>GoalDetailsScreen());},
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(29)),
          child: Stack(children: [
            AspectRatio(
              aspectRatio: 335 / 198,
              child: Image.asset(
                goal.imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => ColoredBox(
                  color: AppColors.primary1.withOpacity(0.12),
                  child: Center(child: Icon(Icons.image_outlined,
                      size: 42, color: AppColors.primary1)),
                ),
              ),
            ),
            // if (goal.isCompleted)
            //   Positioned(
            //     right: 26, bottom: 26,
            //     child: Semantics(
            //       label: 'Goal completed',
            //       child: CircleAvatar(
            //         radius: 15, backgroundColor: AppColors.primary1,
            //         child: const Icon(Icons.check, size: 19, color: Colors.white),
            //       ),
            //     ),
            //   ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(26, 24, 18, 27),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(goal.statusLabel, style: _text(12, muted: true)),
            const SizedBox(height: 7),
            Text(goal.title, style: _text(16, bold: true)),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: goal.isCompleted ? 46 : 0),
                child: Text(goal.rightText, style: _text(12, muted: true)),
              ),
            ),
            const SizedBox(height: 7),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: goal.percent.clamp(0.0, 1.0).toDouble(),
                minHeight: 7,
                backgroundColor: const Color(0xFF90908E),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.warning),
                semanticsLabel: '${goal.title} progress',
                semanticsValue: '${(goal.percent.clamp(0.0, 1.0) * 100).round()}%',
              ),
            ),
          ]),
        ),
      ]),
    ),
  );
}

TextStyle _text(double size, {bool bold = false, bool muted = false}) => TextStyle(
  fontFamily: bold ? 'pb' : 'pr',
  fontSize: size,
  fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
  color: muted ? AppColors.textcolor2 : AppColors.textcolor1,
);
