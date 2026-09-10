import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

class TodayItem {
  final String title;
  final String time;
  final bool done;

  const TodayItem({required this.title, required this.time, this.done = false});
}

class TodayTimelineCard extends StatelessWidget {
  final List<TodayItem> items;

  const TodayTimelineCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 4),
      decoration: BoxDecoration(
        color: AppPalette.cardFill,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppPalette.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++)
            _TodayRow(item: items[i], isLast: i == items.length - 1),
        ],
      ),
    );
  }
}

class _TodayRow extends StatelessWidget {
  final TodayItem item;
  final bool isLast;

  const _TodayRow({required this.item, required this.isLast});

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
              padding: const EdgeInsets.only(bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: const TextStyle(fontSize: 14.5, fontFamily:"popp",fontWeight: FontWeight.w700, color: AppPalette.text)),
                  const SizedBox(height: 3),
                  Text(item.time, style: const TextStyle(fontSize: 12,fontFamily:"popp", color: AppPalette.muted)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
