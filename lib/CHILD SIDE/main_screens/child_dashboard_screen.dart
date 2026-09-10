import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/CHILD%20SIDE/main_screens/profile_items_screen/child_notification_screen.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/main_screens/dashboard_items/notification_screen.dart';

import '../../INDIVIDUAL SIDE/dashboard widgets/learning_card.dart';
import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_card.dart';
import '../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';
import '../../INDIVIDUAL SIDE/teasure_dasbord_widgets/app_progress_bar.dart';
import 'dashboard_items/my_talent_screens.dart';
import 'dashboard_items/pocket_money_screen.dart';


class ChildDashboardScreen extends StatefulWidget {
  const ChildDashboardScreen({
    super.key,
    this.onNotifications,
    this.onSeeAllTasks,
    this.onContinueLesson,
  });

  final VoidCallback? onNotifications;
  final VoidCallback? onSeeAllTasks;
  final VoidCallback? onContinueLesson;

  @override
  State<ChildDashboardScreen> createState() =>
      _ChildDashboardScreenState();
}

class _ChildDashboardScreenState extends State<ChildDashboardScreen> {
  final List<bool> _completedTasks = [true, false, false];

  void _openPocketMoney() {
    Get.to(() => const PocketMoneyScreen());
  }

  void _notification() {
    Get.to(() => ChildNotificationsScreen());
  }

  void _openTalents() {
    Get.to(() => const MyTalentsScreen());
  }
  void _runAction(VoidCallback? action, String message) {
    if (action != null) {
      action();
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _heading(String title) {
    return Text(
      title,
      style: learnText(16, weight: FontWeight.w700),
    );
  }

  Widget _task({
    required int index,
    required String title,
    required String subtitle,
    required String pendingLabel,
  }) {
    final done = _completedTasks[index];

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _completedTasks[index] = !done;
          });
        },
        child: LearnCard(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Row(
            children: [
              Container(
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: done ? learnGreen : Colors.transparent,
                  border: Border.all(
                    color: learnGreen,
                    width: 1.5,
                  ),
                ),
                child: done
                    ? const Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                )
                    : null,
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: learnText(
                        13,
                        weight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(subtitle, style: learnText(11)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                done ? 'Done' : pendingLabel,
                style: learnText(
                  9,
                  color: done
                      ? learnGreen
                      : pendingLabel == 'Ready'
                      ? learnGold
                      : Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconCircle(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: const BoxDecoration(
        color: learnIconBackground,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: learnGreen),
    );
  }

  Widget _jar(String emoji, String amount, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 6),
          Text(
            amount,
            style: learnText(12, weight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: learnText(11, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (_, error, stackTrace) =>
                          _iconCircle(Icons.person),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Good Morning Leo',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          fontFamily: "pops"
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Material(
                    color: learnGreen,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: IconButton(
                      tooltip: 'Notifications',
                      onPressed: () => _notification(),
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 23,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              Row(
                children: [
                  Expanded(child: _heading('Today’s Tasks')),
                  TextButton(
                    onPressed: () => _runAction(
                      widget.onSeeAllTasks,
                      'All of today’s tasks are shown below.',
                    ),
                    child: Text(
                      'See All',
                      style: learnText(
                        10,
                        color: learnGreen,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              _task(
                index: 0,
                title: 'Clean Your Room',
                subtitle: 'Morning. Assigned by Mom',
                pendingLabel: 'Ready',
              ),
              _task(
                index: 1,
                title: 'Bible Reading & Prayer',
                subtitle: '15 mins. Assigned by Dad',
                pendingLabel: 'Ready',
              ),
              _task(
                index: 2,
                title: 'Help Set the Dinner',
                subtitle: 'Evening. Assigned by Mom',
                pendingLabel: 'Later',
              ),

              const SizedBox(height: 24),
              _heading('My Goals'),
              const SizedBox(height: 28),

              // Telescope savings goal
              LearnCard(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _iconCircle(Icons.qr_code_2),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Save for Telescope',
                                style: learnText(
                                  14,
                                  weight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                'Night sky exploration',
                                style: learnText(
                                  11,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              r'$750',
                              style: learnText(
                                15,
                                color: learnGold,
                                weight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              r'of $800',
                              style: learnText(
                                11,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    const AppProgressBar(
                      value: 750 / 800,
                      height: 7,
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '94% Saved',
                            style: learnText(
                              10,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Text(
                          r'Only $50 left to go',
                          style: learnText(
                            10,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              LearnCard(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    _iconCircle(Icons.schedule),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Read 5 Proverbs',
                            style: learnText(
                              13,
                              weight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Building Stewardship',
                            style: learnText(11),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '4 of 5 Read (80%)',
                      style: learnText(9, color: learnGold),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Pocket money overview
              GestureDetector(
                onTap: _openPocketMoney,
                child: LearnCard(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 15,
                            color: learnGreen,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'POCKET STEWARDSHIP',
                              style: learnText(
                                10,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Text(
                            'Safe Junior View',
                            style: learnText(9, color: learnGold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Total Available Pocket Money',
                        style: learnText(
                          13,
                          weight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            r'$18.50',
                            style: learnText(
                              20,
                              color: learnGold,
                              weight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'for wise giving & saving',
                            style: learnText(
                              11,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          _jar('🏦', r'$12.00', 'Savings'),
                          _jar('💛', r'$4.00', 'Giving'),
                          _jar('🍦', r'$2.50', 'Spending'),
                        ],
                      ),
                      const SizedBox(height: 26),
                      Text(
                        'Tap to view Pocket Money breakdown →',
                        style: learnText(
                          11,
                          color: learnGreen,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),
              _heading('Junior Learning'),
              const SizedBox(height: 20),

              LearningCard(
                imageAsset: 'assets/images/bible.png',
                moduleLabel: 'Module 2',
                title: 'The Parable of Talents for Kids',
                progress: 0.65,
                onTap: () => _runAction(
                  widget.onContinueLesson,
                  'Connect your junior lesson screen here.',
                ),
              ),

              const SizedBox(height: 28),

              GestureDetector(
                onTap: _openTalents,
                child: LearnCard(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Talents',
                        style: learnText(
                          14,
                          weight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Developing the gifts God gave you.',
                        style: learnText(11),
                      ),
                      const SizedBox(height: 22),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final label in [
                            'Drawing & Art',
                            'Piano / Music',
                            'Soccer',
                          ])
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFA8BFA1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                label,
                                style: learnText(
                                  9,
                                  color: learnGreen,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Tap to view My Talents →',
                        style: learnText(
                          11,
                          color: learnGreen,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 26),

              LearnCard(
                color: learnGreen,
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.format_quote_rounded,
                      color: learnGold,
                      size: 30,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      '“For where your treasure is, there your '
                          'heart will be also.”',
                      style: learnText(
                        14,
                        color: Colors.white,
                        weight: FontWeight.w600,
                      ).copyWith(height: 1.4),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'MATTHEW 6:21',
                      style: learnText(
                        10,
                        color: const Color(0xFFD8E4D5),
                      ),
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