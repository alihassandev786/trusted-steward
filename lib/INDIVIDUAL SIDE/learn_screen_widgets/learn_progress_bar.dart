import 'package:flutter/material.dart';
import 'learn_theme.dart';

class LearnProgressBar extends StatelessWidget {
  const LearnProgressBar({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF8A8A8A),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: value.clamp(0.0, 1.0),
        heightFactor: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: learnGold,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}