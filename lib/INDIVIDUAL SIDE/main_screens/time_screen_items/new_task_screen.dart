import 'package:flutter/material.dart';
import '../../dashboard widgets/app_palette.dart';
import '../../time_screen_widgets/app_header.dart';
import '../../time_screen_widgets/reminder_tile.dart';
import '../../time_screen_widgets/task_dropdown_field.dart';
import '../../time_screen_widgets/task_picker_field.dart';
import '../../time_screen_widgets/task_text_field.dart';
import '../../widgets/app_button.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _category;
  String? _priority;
  String? _date;
  String? _time;
  bool _reminderOn = true;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTask() {
    // Wire this up to your GetX controller / repository as needed.
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: AppPalette.background,
      body: Column(
        children: [
          // Header keeps the screen's normal side padding.
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: const AppHeader(title: 'New Task'),
            ),
          ),
          const SizedBox(height: 30),

          // Full-bleed sheet: touches both screen edges, rounded only
          // on top, and stretches down past the safe area like the
          // reference design.
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppPalette.cardFill,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 12,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 24 + bottomInset),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create a new stewardship task to stay organized and purposeful.',
                      style: AppTextStyles.body,
                    ),
                    const SizedBox(height: 20),
                    TaskTextField(
                      controller: _nameController,
                      hint: 'Task Name',
                    ),
                    const SizedBox(height: 14),
                    TaskTextField(
                      controller: _descriptionController,
                      hint: 'Description (Optional)',
                      maxLines: 4,
                    ),
                    const SizedBox(height: 14),
                    TaskDropdownField(
                      hint: 'Select a category',
                      value: _category,
                      options: const [
                        'Prayer',
                        'Study',
                        'Finance',
                        'Health',
                        'Family',
                      ],
                      onSelected: (v) => setState(() => _category = v),
                    ),
                    const SizedBox(height: 14),
                    TaskPickerField(
                      hint: 'Select Date',
                      type: PickerFieldType.date,
                      value: _date,
                      onPicked: (v) => setState(() => _date = v),
                    ),
                    const SizedBox(height: 14),
                    TaskPickerField(
                      hint: 'Select Time',
                      type: PickerFieldType.time,
                      value: _time,
                      onPicked: (v) => setState(() => _time = v),
                    ),
                    const SizedBox(height: 14),
                    TaskDropdownField(
                      hint: 'Select a priority',
                      value: _priority,
                      options: const ['Low', 'Medium', 'High'],
                      onSelected: (v) => setState(() => _priority = v),
                    ),
                    const SizedBox(height: 18),
                    ReminderTile(
                      value: _reminderOn,
                      onChanged: (v) => setState(() => _reminderOn = v),
                    ),
                    const SizedBox(height: 22),
                    AppButton(
                      label: 'Save Task',
                      onPressed: () {
                       // Get.to(()=>CompleteProfileScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}