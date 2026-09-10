import 'package:flutter/material.dart';

import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_card.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';
import '../../../INDIVIDUAL SIDE/teasure_dasbord_widgets/detail_screen_header.dart';


class ChildNotificationsScreen extends StatelessWidget {
  const ChildNotificationsScreen({super.key});

  static const List<Map<String, String>> _notifications = [
    {
      'title': 'Task Completed',
      'description': 'Your task has been completed.',
      'time': '2m ago',
    },
    {
      'title': 'Daily Scripture',
      'description': 'Receive a daily verse for reflection',
      'time': '5m ago',
    },
    {
      'title': 'Lesson Completed',
      'description': 'Your lesson has been completed',
      'time': '2m ago',
    },
    {
      'title': 'Learning Notifications',
      'description': 'Reminder to continue your stewardship',
      'time': '5m ago',
    },
    {
      'title': 'Goal Reminders',
      'description': 'Update on your saving and giving goals',
      'time': '2m ago',
    },
    {
      'title': 'Task Completed',
      'description': 'Your task has been completed.',
      'time': '5m ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              const DetailScreenHeader(
                title: 'Notifications',
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  children: [
                    for (final notification in _notifications)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: LearnCard(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 22,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notification['title']!,
                                      style: learnText(
                                        14,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      notification['description']!,
                                      style: learnText(12),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                notification['time']!,
                                style: learnText(
                                  10,
                                  color: learnGreen,
                                ),
                              ),
                            ],
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
    );
  }
}