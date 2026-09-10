import 'package:flutter/material.dart';
import 'app_palette.dart';

class InsightCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InsightCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppPalette.gold,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(fontSize: 15.5,fontFamily: "pop", fontWeight: FontWeight.w800, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 12.5, fontFamily: "pop",color: Colors.white.withOpacity(0.95), height: 1.5),
          ),
        ],
      ),
    );
  }
}
