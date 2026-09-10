import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

/// Rounded field that opens a bottom sheet list to pick one option.
/// Looks like the "Select a category" / "Select a priority" rows.
class TaskDropdownField extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> options;
  final ValueChanged<String> onSelected;

  const TaskDropdownField({
    super.key,
    required this.hint,
    required this.options,
    required this.onSelected,
    this.value,
  });

  static const Color fieldFill = Color(0xFFEBE6D6);

  Future<void> _openPicker(BuildContext context) async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppPalette.cream,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: options
                  .map((o) => ListTile(
                title: Text(o, style: AppTextStyles.fieldValue),
                onTap: () => Navigator.pop(context, o),
              ))
                  .toList(),
            ),
          ),
        );
      },
    );
    if (selected != null) onSelected(selected);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => _openPicker(context),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: fieldFill,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value ?? hint,
                style: value == null
                    ? AppTextStyles.fieldHint
                    : AppTextStyles.fieldValue,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down_rounded,
                color: AppPalette.green),
          ],
        ),
      ),
    );
  }
}