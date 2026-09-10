import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';


class ScheduleItem {
  final IconData icon;
  final String title;
  final String time;
  final String note;
  final bool active;

  const ScheduleItem({
    required this.icon,
    required this.title,
    required this.time,
    required this.note,
    this.active = false,
  });
}

class SchedulePreviewCard extends StatelessWidget {
  final List<ScheduleItem> items;

  const SchedulePreviewCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 4),
      decoration: BoxDecoration(
        color: AppPalette.cardFill,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppPalette.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++)
            _ScheduleRow(item: items[i], isLast: i == items.length - 1),
        ],
      ),
    );
  }
}

class _ScheduleRow extends StatelessWidget {
  final ScheduleItem item;
  final bool isLast;

  const _ScheduleRow({required this.item, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.active ? AppPalette.green : AppPalette.cardFill,
                  border: Border.all(color: AppPalette.green, width: 2),
                ),
                child: Icon(
                  item.icon,
                  size: 15,
                  color: item.active ? Colors.white : AppPalette.green,
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
                  Text.rich(
                    TextSpan(
                      style: AppTextStyles.subtitle,
                      children: [
                        TextSpan(text: item.time),
                        TextSpan(text: '  (${item.note})'),
                      ],
                    ),
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
