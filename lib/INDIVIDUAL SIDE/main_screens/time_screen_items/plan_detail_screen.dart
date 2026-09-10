import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/time_screen_items/complete_task_screen.dart';
import '../../dashboard widgets/app_palette.dart';
import '../../time_screen_widgets/detail_info_card.dart';
import '../../time_screen_widgets/journal_row_card.dart';
import '../../time_screen_widgets/pill_badge.dart';
import '../../time_screen_widgets/task_item.dart';
import '../../time_screen_widgets/when_reminder_card.dart';
import '../../widgets/app_button.dart';

class TaskDetailScreen extends StatelessWidget {
  final TaskItem task;

  const TaskDetailScreen({super.key, required this.task});

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
                    onTap: () => Get.back(),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.green),
                      child: const Icon(Icons.chevron_left, color: Colors.white, size: 26),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Task Detail',
                    style: TextStyle(fontSize: 20,fontFamily:"pops", fontWeight: FontWeight.w800, color: AppPalette.text),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // ── Title + category ─────────────────────────────────
              Text(task.category, style: const TextStyle(fontSize: 21,fontFamily:"popp", fontWeight: FontWeight.w800, color: AppPalette.text)),
              const SizedBox(height: 4),
              Text(task.tag == 'Spiritual' ? 'Spiritual Growth' : task.tag,
                  style: const TextStyle(fontSize: 13, fontFamily:"popp",color: AppPalette.muted)),
              const SizedBox(height: 14),

              // ── Status + priority badges ─────────────────────────
              Row(
                children: [
                  PillBadge(
                    icon: Icons.access_time_rounded,
                    label: task.status,
                    background: AppPalette.green.withOpacity(0.15),
                    foreground: AppPalette.green,
                  ),
                  const SizedBox(width: 10),
                  PillBadge(
                    icon: Icons.priority_high_rounded,
                    label: task.priority,
                    background: AppPalette.danger.withOpacity(0.15),
                    foreground: AppPalette.danger,
                  ),
                ],
              ),
              const SizedBox(height: 22),

              DetailInfoCard(text: task.detailsText),
              const SizedBox(height: 16),

              WhenReminderCard(whenText: task.whenText, reminderText: task.reminderText),
              const SizedBox(height: 16),

              JournalRowCard(
                title: 'Open Journal',
                subtitle: task.journalSubtitle,
                onTap: () {},
              ),
              const SizedBox(height: 40),

              AppButton(label: 'Complete Task', onPressed: () => Get.to(()=>CompletedTaskScreen())),
            ],
          ),
        ),
      ),
    );
  }
}