import 'package:flutter/material.dart';
import '../teasure_dasbord_widgets/finance_theme.dart';


class GoalCover extends StatelessWidget {
  const GoalCover({super.key, required this.image, this.height = 198});

  final ImageProvider image;
  final double height;

  @override
  Widget build(BuildContext context) => Image(
    image: image,
    height: height,
    width: double.infinity,
    fit: BoxFit.cover,
    errorBuilder: (_, __, ___) => Container(
      height: height,
      color: FinanceColors.iconBg,
      child: const Center(
        child: Icon(Icons.photo_outlined, color: FinanceColors.green, size: 42),
      ),
    ),
  );
}
