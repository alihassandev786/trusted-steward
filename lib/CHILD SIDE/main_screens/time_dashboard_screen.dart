import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/CHILD%20SIDE/main_screens/task_screen_items/task_details_screen.dart';

import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_card.dart';
import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  void _openTaskDetails() {
    Get.to(() => const TaskDetailsScreen());
  }

  Widget _taskCard({
    required String category,
    required String time,
    required String title,
    required String description,
    required String assignedBy,
    bool completed = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _openTaskDetails,
        child: LearnCard(
          padding: const EdgeInsets.fromLTRB(28, 28, 26, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA8BFA1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: learnText(
                        10,
                        color: learnGreen,
                      ),
                    ),
                  ),
                  Text(
                    time,
                    style: learnText(
                      10,
                      color: completed ? learnGreen : learnGold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Text(
                title,
                style: learnText(
                  14,
                  weight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                description,
                style: learnText(12).copyWith(height: 1.35),
              ),

              const SizedBox(height: 6),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      assignedBy,
                      style: learnText(
                        12,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Material(
                    color: learnGreen,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: IconButton(
                      tooltip: 'Open task details',
                      onPressed: _openTaskDetails,
                      constraints: const BoxConstraints(
                        minWidth: 45,
                        minHeight: 45,
                      ),
                      icon: const Icon(
                        Icons.chevron_right,
                        size: 27,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Time Dashboard',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  fontFamily: "pops"
                ),
              ),

              const SizedBox(height: 46),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: LearnCard(
                  color: learnGreen,
                  padding: const EdgeInsets.fromLTRB(22, 38, 22, 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8FAF93),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Daily Blessing',
                          style: learnText(
                            10,
                            color: learnGreen,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      Text(
                        'Every helper brings joy to the home!',
                        style: learnText(
                          14,
                          color: Colors.white,
                          weight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Check off tasks to fill your weekly blessing '
                            'jar, and complete it on time.',
                        style: learnText(
                          12,
                          color: const Color(0xFFD8E4D5),
                        ).copyWith(height: 1.4),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              Text(
                'Today’s Responsibilities',
                style: learnText(
                  16,
                  weight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 24),

              _taskCard(
                category: 'Home & Care',
                time: 'Due 4:00 PM',
                title: 'Clean Your Room',
                description:
                'Pick up toys, make bed nicely, and\n'
                    'put laundry in basket.',
                assignedBy: 'Assigned by Mom',
              ),

              _taskCard(
                category: 'Spiritual Growth',
                time: '7:00 PM',
                title: 'Read Psalm 23 Reflect',
                description:
                'Read softly with family or alone,\n'
                    'write one verse you like.',
                assignedBy: 'Assigned by Dad',
              ),

              _taskCard(
                category: 'Pets Care',
                time: 'Completed 8:30 AM',
                title: 'Feed Buster (Dog)',
                description:
                'Pick up toys, make bed nicely, and\n'
                    'put laundry in basket.',
                assignedBy: 'Assigned by Mom',
                completed: true,
              ),

              _taskCard(
                category: 'Pets Care',
                time: 'Completed 8:30 AM',
                title: 'Feed Buster (Dog)',
                description:
                'Pick up toys, make bed nicely, and\n'
                    'put laundry in basket.',
                assignedBy: 'Assigned by Mom',
                completed: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}