import 'package:flutter/material.dart';

import '../../dashboard widgets/app_palette.dart';
import '../../time_screen_widgets/app_header.dart';
import '../../time_screen_widgets/calendar_card.dart';
import '../../time_screen_widgets/segmented_toggle.dart';
import '../../time_screen_widgets/task_tile.dart';

class TimeTrackingScreen extends StatefulWidget {
  const TimeTrackingScreen({super.key});

  @override
  State<TimeTrackingScreen> createState() => _TimeTrackingScreenState();
}

class _TimeTrackingScreenState extends State<TimeTrackingScreen> {
  int _toggleIndex = 0; // 0 = Monthly, 1 = Weekly
  DateTime _month = DateTime(2023, 10);
  int _selectedDay = 13;

  final Map<int, DayMarker> _markers = const {
    9: DayMarker.gold,
    11: DayMarker.green,
    16: DayMarker.green,
    20: DayMarker.gold,
    28: DayMarker.green,
  };

  final List<Map<String, String>> _tasks = const [
    {
      'time': '09:00\nAm',
      'title': 'Monday Reflection',
      'subtitle': 'Personal study and prayer time',
    },
    {
      'time': '02:30\nAm',
      'title': 'Stewardship Review',
      'subtitle': 'Monthly budget alignment with...',
    },
  ];

  void _changeMonth(int delta) {
    setState(() {
      _month = DateTime(_month.year, _month.month + delta);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(title: 'Time Tracking'),
              const SizedBox(height: 24),
              Center(
                child: SegmentedToggle(
                  options: const ['Monthly', 'Weekly'],
                  selectedIndex: _toggleIndex,
                  onChanged: (i) => setState(() => _toggleIndex = i),
                ),
              ),
              const SizedBox(height: 22),
              CalendarCard(
                month: _month,
                selectedDay: _selectedDay,
                markers: _markers,
                onDaySelected: (d) => setState(() => _selectedDay = d),
                onPrevMonth: () => _changeMonth(-1),
                onNextMonth: () => _changeMonth(1),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: Text('Friday, Oct 20', style: AppTextStyles.title),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: AppPalette.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ..._tasks.map((t) => TaskTile(
                    time: t['time']!,
                    title: t['title']!,
                    subtitle: t['subtitle']!,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
