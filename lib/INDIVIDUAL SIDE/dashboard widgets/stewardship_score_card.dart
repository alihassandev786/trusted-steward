import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'app_palette.dart';
import '../main_screens/dashboard_items/steward_score_screen.dart';

import 'off_white_container.dart';

class StewardshipScoreCard extends StatelessWidget {
  final int score;
  final int maxScore;
  final String title;
  final String description;
  final VoidCallback onViewDetails;

  const StewardshipScoreCard({
    super.key,
    required this.score,
    required this.maxScore,
    required this.title,
    required this.description,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final progress = score / maxScore;
    return OffWhiteContainer(
      child: Column(
        children: [
          const Text(
            'Stewardship Score',
            style: TextStyle(fontSize: 13,fontFamily: "pop", color: AppPalette.muted, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: 168,
            height: 168,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 168,
                  height: 168,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 13,
                    strokeCap: StrokeCap.round,
                    backgroundColor: AppPalette.track,
                    valueColor: const AlwaysStoppedAnimation(AppPalette.gold),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$score',
                      style: const TextStyle(fontSize: 34,fontFamily: "pop", fontWeight: FontWeight.w800, color: AppPalette.gold),
                    ),
                    Text(
                      '/$maxScore',
                      style: const TextStyle(fontSize: 13,fontFamily: "pop", color: AppPalette.muted, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontFamily: "pop",fontWeight: FontWeight.w800, color: AppPalette.text),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13,fontFamily: "pop", color: AppPalette.muted, height: 1.5),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: (){Get.to(()=>StewardScoreScreen());},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPalette.green,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              ),
              child: const Text('View Details', style: TextStyle(fontSize: 15,fontFamily: "pop", fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }
}
