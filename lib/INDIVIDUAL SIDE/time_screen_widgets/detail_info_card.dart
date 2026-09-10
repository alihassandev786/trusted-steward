import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';


class DetailInfoCard extends StatelessWidget {
  final String text;

  const DetailInfoCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Details!',
            style: TextStyle(fontSize: 12.5,fontFamily:"popp", fontWeight: FontWeight.w600, color: AppPalette.muted),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontFamily:"popp",color: AppPalette.text, height: 1.55, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
