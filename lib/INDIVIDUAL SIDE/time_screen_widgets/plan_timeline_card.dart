import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/time_screen_widgets/task_item.dart';

import '../dashboard widgets/app_palette.dart';
import '../main_screens/time_screen_items/plan_detail_screen.dart';
import 'pill_badge.dart';

class PlanTimelineCard extends StatelessWidget {
  final TaskItem item;
  final bool isLast;

  const PlanTimelineCard({
    super.key,
    required this.item,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot and line
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppPalette.cardFill,
                  border: Border.all(
                    color: AppPalette.green,
                    width: 2,
                  ),
                ),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppPalette.green,
                  ),
                ),
              ),

              // Line will continue for every item, including the last one
              Expanded(
                child: Container(
                  width: 2,
                  color: AppPalette.green.withOpacity(0.3),
                ),
              ),
            ],
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => TaskDetailScreen(task: item));
                },
                child: Container(
                  width: double.infinity,
                  height: h * 0.18,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppPalette.cardFill,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppPalette.border,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PillBadge(
                            icon: item.tagIcon,
                            label: item.tag,
                            background:
                            AppPalette.green.withOpacity(0.15),
                            foreground: AppPalette.green,
                          ),
                          Text(
                            item.time,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'popp',
                              color: AppPalette.muted,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'popp',
                          fontWeight: FontWeight.w700,
                          color: AppPalette.text,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontFamily: 'popp',
                          color: AppPalette.muted,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}