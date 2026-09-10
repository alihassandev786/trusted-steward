import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

class WhenReminderCard extends StatelessWidget {
  final String whenText;
  final String reminderText;

  const WhenReminderCard({super.key, required this.whenText, required this.reminderText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
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
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(child: _Column(label: 'When', value: whenText)),
            Container(width: 1, color: AppPalette.gold.withOpacity(0.5), margin: const EdgeInsets.symmetric(horizontal: 14)),
            Expanded(child: _Column(label: 'Reminder', value: reminderText)),
          ],
        ),
      ),
    );
  }
}

class _Column extends StatelessWidget {
  final String label;
  final String value;

  const _Column({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontFamily:"popp",color: AppPalette.muted)),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700,fontFamily:"popp",color: AppPalette.text)),
      ],
    );
  }
}
