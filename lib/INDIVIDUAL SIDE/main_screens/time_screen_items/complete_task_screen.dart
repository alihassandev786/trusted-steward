import 'package:flutter/material.dart';
import '../../dashboard widgets/app_palette.dart';
import '../../time_screen_widgets/today_timeline_card.dart';
import '../../time_screen_widgets/weekly_harvest_section.dart';


/// NOTE: Add these two images to your project and register them in
/// pubspec.yaml:
///   assets:
///     - assets/images/bg.png        (confetti background overlay)
///     - assets/images/compTask.png  (tree icon shown in the circle)
/// If either file is missing, a safe fallback is shown automatically.
class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppPalette.background, // plain white
      body: Stack(fit: StackFit.expand,
        children: [
          // ── Confetti background image, pinned to the top ─────────
          Image.asset(
            'assets/images/bg.png',
            width: double.infinity,
            height: 260,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const SizedBox(height: 260),
          ),

          // ── Foreground content ────────────────────────────────────
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.green),
                      child: const Icon(Icons.chevron_left, color: Colors.white, size: 26),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Tree icon in a soft circle
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        //color: AppPalette.cardFill,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(0.06),
                        //     blurRadius: 14,
                        //     offset: const Offset(0, 6),
                        //   ),
                        // ],
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Image.asset(
                        'assets/images/compTask.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.park_rounded, size: 40, color: AppPalette.green),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Well Done, Good & Faithful',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, fontFamily:"pops",fontWeight: FontWeight.w800, color: AppPalette.text),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Your stewardship this week has cultivated\npeace and order.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13.5,fontFamily:"popp", color: AppPalette.muted, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 36),

                  const WeeklyHarvestSection(
                    completedTasks: 24,
                    progress: 0.35,
                    caption: 'On track for your weekly rhythm',
                  ),
                  const SizedBox(height: 36),

                  const Text('Today', style: AppTextStyles.heading),
                  const SizedBox(height: 14),
                  const TodayTimelineCard(
                    items: [
                      TodayItem(title: 'Morning Player', time: '6:30 AM', done: true),
                      TodayItem(title: 'Review Monthly Budget', time: '7:00 AM'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}