import 'package:flutter/material.dart';

import '../dashboard widgets/app_palette.dart';


/// Two-option pill toggle (e.g. Monthly / Weekly).
class SegmentedToggle extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const SegmentedToggle({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppPalette.tileFill,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(options.length, (index) {
          final bool isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onChanged(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppPalette.green : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                options[index],
                style: AppTextStyles.title.copyWith(
                  color: isSelected ? Colors.white : AppPalette.text,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
