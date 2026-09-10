import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';
import 'app_toggle_switch.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: AppPalette.cream,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15,fontFamily: "pop", fontWeight: FontWeight.w700, color: AppPalette.text),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12,fontFamily: "pop", color: AppPalette.muted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          AppToggleSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
