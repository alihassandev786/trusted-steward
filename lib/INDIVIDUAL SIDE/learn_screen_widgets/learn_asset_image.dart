import 'package:flutter/material.dart';
import 'learn_theme.dart';

class LearnAssetImage extends StatelessWidget {
  const LearnAssetImage({
    super.key,
    required this.path,
    this.height,
  });

  final String path;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: double.infinity,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (_, error, stackTrace) {
        return Container(
          height: height,
          width: double.infinity,
          color: learnIconBackground,
          alignment: Alignment.center,
          child: const Icon(
            Icons.image_outlined,
            color: learnGreen,
            size: 36,
          ),
        );
      },
    );
  }
}