import 'package:flutter/material.dart';
import 'app_palette.dart';
import 'resource_tile.dart';

class ResourcesSection extends StatelessWidget {
  final List<ResourceTile> tiles;

  const ResourcesSection({super.key, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Your Resources', style: AppTextStyles.heading),
        const SizedBox(height: 14),
        for (int i = 0; i < tiles.length; i++) ...[
          tiles[i],
          if (i != tiles.length - 1) const SizedBox(height: 12),
        ],
      ],
    );
  }
}
