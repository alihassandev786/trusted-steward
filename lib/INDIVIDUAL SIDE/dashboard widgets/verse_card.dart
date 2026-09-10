import 'package:flutter/material.dart';
import 'app_palette.dart';

class VerseCard extends StatelessWidget {
  final String verse;
  final String reflection;

  const VerseCard({super.key, required this.verse, required this.reflection});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppPalette.green,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, size: 40, color: AppPalette.gold),
          const SizedBox(height: 6),
          Text(
            verse,
            style: const TextStyle(fontSize: 16,fontFamily: "pop", fontWeight: FontWeight.w700, color: Colors.white, height: 1.4),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              reflection,
              style: TextStyle(fontSize: 12.5, fontFamily: "pop",color: Colors.white.withOpacity(0.9), height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
