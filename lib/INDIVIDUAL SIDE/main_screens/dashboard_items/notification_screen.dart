import 'package:flutter/material.dart';
import '../../dashboard widgets/app_palette.dart';
import '../../widgets/notification_tile.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final Map<String, bool> _settings = {
    'Task Reminders': true,
    'Daily Scripture': true,
    'Budget Alerts': true,
    'Learning Notifications': false,
    'Goal Reminders': true,
    'AI Recommendations': false,
    'Weekly Progress': true,
    'Goal Reminders 2': true,
  };

  final List<Map<String, String>> _items = const [
    {'key': 'Task Reminders', 'title': 'Task Reminders', 'subtitle': 'Stay on top of stewardship.'},
    {'key': 'Daily Scripture', 'title': 'Daily Scripture', 'subtitle': 'Receive a daily verse for reflection'},
    {'key': 'Budget Alerts', 'title': 'Budget Alerts', 'subtitle': 'When approaching budget limits'},
    {'key': 'Learning Notifications', 'title': 'Learning Notifications', 'subtitle': 'Reminder to continue your stewardship'},
    {'key': 'Goal Reminders', 'title': 'Goal Reminders', 'subtitle': 'Update  on your saving and giving goals'},
    {'key': 'AI Recommendations', 'title': 'AI Recommendations', 'subtitle': 'Smart suggestions for resources.'},
    {'key': 'Weekly Progress', 'title': 'Weekly Progress', 'subtitle': 'A digest of your stewardship journey.'},
    {'key': 'Goal Reminders 2', 'title': 'Goal Reminders', 'subtitle': 'Update  on your saving and giving goals'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ─────────────────────────────────────────
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.green),
                      child: const Icon(Icons.chevron_left, color: Colors.white, size: 26),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Notifications',
                    style: TextStyle(fontSize: 20,fontFamily: "pops", fontWeight: FontWeight.w800, color: AppPalette.text),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // ── Toggle list ──────────────────────────────────────
              for (int i = 0; i < _items.length; i++) ...[
                NotificationTile(
                  title: _items[i]['title']!,
                  subtitle: _items[i]['subtitle']!,
                  value: _settings[_items[i]['key']]!,
                  onChanged: (v) => setState(() => _settings[_items[i]['key']!] = v),
                ),
                if (i != _items.length - 1) const SizedBox(height: 14),
              ],
            ],
          ),
        ),
      ),
    );
  }
}