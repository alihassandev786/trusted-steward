import 'package:flutter/material.dart';
import 'app_palette.dart';
import 'off_white_container.dart';

class PlanItem {
  final String title;
  final String time;
  final bool done;

  const PlanItem({required this.title, required this.time, this.done = false});
}

class TodaysPlanCard extends StatelessWidget {
  final List<PlanItem> items;

  const TodaysPlanCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return OffWhiteContainer(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 4),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++)
            _PlanRow(item: items[i], isLast: i == items.length - 1),
        ],
      ),
    );
  }
}

class _PlanRow extends StatelessWidget {
  final PlanItem item;
  final bool isLast;

  const _PlanRow({required this.item, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.done ? AppPalette.green : Colors.transparent,
                  border: Border.all(color: AppPalette.green, width: 2),
                ),
                child: item.done
                    ? const Icon(Icons.check, size: 13, color: Colors.white)
                    : Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: AppPalette.green),
                      ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 2, color: AppPalette.green.withOpacity(0.35)),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: AppTextStyles.title),
                  const SizedBox(height: 3),
                  Text(item.time, style: AppTextStyles.subtitle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
