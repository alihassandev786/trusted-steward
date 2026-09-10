import 'package:flutter/material.dart';
import '../../dashboard widgets/app_palette.dart';
import '../../time_screen_widgets/app_header.dart';
import '../../time_screen_widgets/clarity_card.dart';
import '../../time_screen_widgets/stat_card.dart';
import '../../time_screen_widgets/weekly_flow_chart.dart';


class TimeStewardshipScreen extends StatelessWidget {
  const TimeStewardshipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace these with real values from your controller / repository.
    const primarySeries = <double>[20, 45, 35, 70, 55, 85, 80];
    const secondarySeries = <double>[8, 10, 6, 18, 22, 30, 42];
    const dayLabels = ['Mon', '', 'Wed', '', 'Fri', '', 'Sun'];

    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(title: 'Time Stewardship'),
              const SizedBox(height: 20),
              const WeeklyFlowCard(
                primarySeries: primarySeries,
                secondarySeries: secondarySeries,
                dayLabels: dayLabels,
              ),
              const SizedBox(height: 18),
              Row(
                children: const [
                  Expanded(
                    child: StatCard(
                      icon: Icon(Icons.check_rounded,
                          color: AppPalette.green, size: 22),
                      value: '82%',
                      label: 'Tasks',
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: StatCard(
                      icon: Icon(Icons.self_improvement_rounded,
                          color: AppPalette.green, size: 22),
                      value: '64%',
                      label: 'Habits',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: const [
                  Expanded(
                    child: StatCard(
                      icon: Icon(Icons.volunteer_activism_rounded,
                          color: AppPalette.green, size: 22),
                      value: '5/7 Days',
                      label: 'Prayer',
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: StatCard(
                      icon: Icon(Icons.auto_stories_outlined,
                          color: AppPalette.green, size: 22),
                      value: '3/7 Days',
                      label: 'Reading',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const ClarityCard(
                title: 'A Moment of Clarity',
                message:
                '"Time is not measured by the clock, but by the moments that matter." Gently guide your attention back when it drifts, honoring the time you given.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}