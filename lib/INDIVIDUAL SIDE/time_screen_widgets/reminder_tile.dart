import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

/// Row with a bell icon, "Reminder" label and a switch on the right.
class ReminderTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const ReminderTile({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppPalette.tileFill,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppPalette.iconBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.notifications,
                color: AppPalette.green),
          ),
          const SizedBox(width: 14),
          Expanded(child: Text('Reminder', style: AppTextStyles.title)),
          SizedBox(height: 10,width: 40,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.white,
              activeTrackColor: AppPalette.green,
              inactiveTrackColor: AppPalette.track,
              inactiveThumbColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
