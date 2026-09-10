import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

/// Rounded, filled text field used for Task Name / Description.
class TaskTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final int maxLines;

  const TaskTextField({
    super.key,
    this.controller,
    required this.hint,
    this.maxLines = 1,
  });

  static const Color fieldFill = Color(0xFFEBE6D6);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: AppTextStyles.fieldValue,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.fieldHint,
        filled: true,
        fillColor: fieldFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}