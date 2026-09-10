import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/CHILD%20SIDE/main_screens/task_screen_items/task_completion_screen.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/course_info.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_button.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_card.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_progress_bar.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({
    super.key,
    this.imageAsset = 'assets/images/task.png',
    this.onComplete,
  });

  final String imageAsset;
  final Future<void> Function()? onComplete;

  @override
  State<TaskDetailsScreen> createState() =>
      _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final List<String> _steps = [
    'Make bed with pillows straight',
    'Put toys & books in their bins',
    'Put laundry into hamper',
  ];

  final List<bool> _completed = [true, false, false];

  bool _saving = false;

  int get _doneCount => _completed.where((done) => done).length;

  double get _progress => _doneCount / _steps.length;

  bool get _allDone => _completed.every((done) => done);

  void _completeTask() {
    Get.to(() => const TaskCompletedScreen());
  }

  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: learnBackground,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full-width task image
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(65),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          widget.imageAsset,
                          fit: BoxFit.cover,
                          errorBuilder: (_, error, stackTrace) =>
                          const ColoredBox(
                            color: learnIconBackground,
                            child: Center(
                              child: Icon(
                                Icons.cleaning_services_outlined,
                                size: 70,
                                color: learnGreen,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0x33000000),
                                Color(0x22000000),
                                Color(0xCC000000),
                              ],
                              stops: [0, 0.45, 1],
                            ),
                          ),
                        ),
                      ),

                      SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            20, 28, 20, 42,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                color: const Color(0xFF205B35),
                                shape: const CircleBorder(),
                                clipBehavior: Clip.antiAlias,
                                child: IconButton(
                                  tooltip: 'Back',
                                  onPressed: _saving
                                      ? null
                                      : () => Navigator.maybePop(context),
                                  icon: const Icon(
                                    Icons.chevron_left,
                                    color: Colors.white,
                                    size: 27,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 52),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 29,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 17,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: learnGreen.withValues(
                                          alpha: 0.55,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'Beginner',
                                        style: learnText(
                                          10,
                                          color: const Color(0xFF8DCD71),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 17),
                                    Text(
                                      'Clean Your Room',
                                      style: learnText(
                                        14,
                                        color: Colors.white,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Assigned by Mom',
                                      style: learnText(
                                        12,
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
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LearnCard(
                      padding: const EdgeInsets.fromLTRB(
                        26, 30, 26, 36,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your Progress Steps',
                                      style: learnText(
                                        12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${(_progress * 100).round()}% Complete',
                                      style: learnText(
                                        16,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFA8BFA1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '$_doneCount of ${_steps.length} Done',
                                  style: learnText(
                                    10,
                                    color: learnGreen,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          LearnProgressBar(value: _progress),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      'About This Task',
                      style: learnText(
                        16,
                        weight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      "An in-depth study of what it means to be a faithful "
                          "steward of God's resources. Discover practical, "
                          "biblically-grounded strategies for managing your "
                          "time, talents, and treasures with wisdom and purpose.",
                      style: learnText(12).copyWith(height: 1.55),
                    ),

                    const SizedBox(height: 28),

                    const Wrap(
                      spacing: 36,
                      runSpacing: 12,
                      children: [
                        CourseInfo(
                          icon: Icons.schedule,
                          label: '5:00 PM',
                        ),
                        CourseInfo(
                          icon: Icons.man ,
                          label: 'Assigned by Mom',
                        ),
                      ],
                    ),

                    const SizedBox(height: 38),

                    Text(
                      'Your Progress Steps',
                      style: learnText(
                        16,
                        weight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 34),

                    for (int index = 0; index < _steps.length; index++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Semantics(
                          label: _steps[index],
                          checked: _completed[index],
                          enabled: !_saving,
                          child: GestureDetector(
                            onTap: _saving
                                ? null
                                : () {
                              setState(() {
                                _completed[index] =
                                !_completed[index];
                              });
                            },
                            child: LearnCard(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: learnIconBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      _completed[index]
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      color: learnGreen,
                                      size: 19,
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      _steps[index],
                                      style: learnText(
                                        14,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    const SizedBox(height: 28),

                    LearnButton(
                      label: _saving
                          ? 'Saving...'
                          : 'Mark as Complete',
                      onPressed: _allDone && !_saving
                          ? _completeTask
                          : null,
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
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
}