import 'package:flutter/material.dart';
import '../dashboard widgets/app_palette.dart';

enum PickerFieldType { date, time }

/// Rounded field with a trailing calendar/clock icon that opens the
/// native date or time picker. Used for "Select Date" / "Select Time".
class TaskPickerField extends StatelessWidget {
  final String hint;
  final String? value;
  final PickerFieldType type;
  final ValueChanged<String> onPicked;

  const TaskPickerField({
    super.key,
    required this.hint,
    required this.type,
    required this.onPicked,
    this.value,
  });

  static const Color fieldFill = Color(0xFFEBE6D6);

  Future<void> _open(BuildContext context) async {
    if (type == PickerFieldType.date) {
      final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppPalette.green,
                onPrimary: Colors.white,
                onSurface: AppPalette.text,
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null) {
        onPicked('${picked.day}/${picked.month}/${picked.year}');
      }
    } else {
      final picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppPalette.green,
                onPrimary: Colors.white,
                onSurface: AppPalette.text,
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null) {
        onPicked(picked.format(context));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () => _open(context),
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
            Icon(
              type == PickerFieldType.date
                  ? Icons.calendar_today_outlined
                  : Icons.access_time_rounded,
              size: 18,
              color: AppPalette.green,
            ),
          ],
        ),
      ),
    );
  }
}