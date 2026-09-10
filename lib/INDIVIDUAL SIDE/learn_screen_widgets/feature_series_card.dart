import 'package:flutter/material.dart';
import 'learn_asset_image.dart';
import 'learn_card.dart';
import 'learn_theme.dart';

class FeaturedSeriesCard extends StatelessWidget {
  const FeaturedSeriesCard({
    super.key,
    required this.image,
    required this.tag,
    required this.title,
    required this.details,
    this.onTap,
  });

  final String image;
  final String tag;
  final String title;
  final String details;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 270,
      child: GestureDetector(
        onTap: onTap,
        child: LearnCard(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LearnAssetImage(
                path: image,
                height: 137,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tag,
                      style: learnText(11, color: Colors.black54),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: learnText(14, weight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      details,
                      style: learnText(11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}