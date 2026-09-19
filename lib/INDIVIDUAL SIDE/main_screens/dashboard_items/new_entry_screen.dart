import 'package:flutter/material.dart';

import '../../dashboard widgets/journal_image_picker.dart';
import '../../dashboard widgets/journel_wedgits.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';

class NewEntryScreen extends StatefulWidget {
  const NewEntryScreen({
    super.key,

    this.editing = false,

    this.fromPrompt = false,

    this.initialTitle = 'Morning Quiet & Stewardship of Rest',

    this.initialDescription = '',

    this.initialCategory = 'Stewardship Reflection',
  });

  final bool editing;

  final bool fromPrompt;

  final String initialTitle;

  final String initialDescription;

  final String initialCategory;

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _title;

  late final TextEditingController _description;

  String? _category;

  String? _tag;

  TimeOfDay? _time;

  DateTime? _date;

  @override
  void initState() {
    super.initState();

    _title = TextEditingController(
      text: widget.editing ? widget.initialTitle : '',
    );

    _description = TextEditingController(
      text: widget.editing
          ? widget.initialDescription
          : widget.fromPrompt
          ? 'Where did you observe unhurried grace in your '
                'stewardship of time or fellowship today?\n\n'
          : '',
    );

    if (widget.editing) {
      _category = widget.initialCategory;

      _tag = 'Time';
    }
  }

  @override
  void dispose() {
    _title.dispose();

    _description.dispose();

    super.dispose();
  }

  Future<void> _pickTime() async {
    final result = await showTimePicker(
      context: context,

      initialTime: _time ?? TimeOfDay.now(),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: journalGreen,

              onPrimary: Colors.white,

              secondary: journalGreen,

              surface: journalCardColor,

              onSurface: Colors.black87,
            ),

            timePickerTheme: TimePickerThemeData(
              backgroundColor: journalCardColor,

              hourMinuteColor: journalYellow,

              dialBackgroundColor: journalYellow,

              dialHandColor: journalGreen,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),

          child: child!,
        );
      },
    );

    if (!mounted || result == null) return;

    setState(() {
      _time = result;
    });
  }

  Future<void> _pickDate() async {
    final result = await showDatePicker(
      context: context,

      initialDate: _date ?? DateTime.now(),

      firstDate: DateTime(2000),

      lastDate: DateTime(2100),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: journalGreen,

              onPrimary: Colors.white,

              surface: journalCardColor,

              onSurface: Colors.black87,
            ),

            datePickerTheme: DatePickerThemeData(
              backgroundColor: journalCardColor,

              headerBackgroundColor: journalGreen,

              headerForegroundColor: Colors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),

          child: child!,
        );
      },
    );

    if (!mounted || result == null) return;

    setState(() {
      _date = result;
    });
  }

  Widget _dropdown({
    required String hint,

    required String? value,

    required List<String> options,

    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,

      isExpanded: true,

      decoration: journalInputDecoration(hint),

      dropdownColor: journalCardColor,

      style: FinanceText.body(size: 12, color: Colors.black87),

      icon: const Icon(Icons.keyboard_arrow_down, color: journalGreen),

      items: options.map((e) {
        return DropdownMenuItem(value: e, child: Text(e));
      }).toList(),

      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return JournalPage(
      title: widget.editing ? 'Edit Entry' : 'New Entry',

      horizontalPadding: 0,

      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 65),

          decoration: BoxDecoration(
            color: journalCardColor,

            borderRadius: const BorderRadius.vertical(top: Radius.circular(68)),

            border: Border.all(color: const Color(0xFFE1DFD6)),
          ),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Text(
                  widget.editing
                      ? 'Update your journal entry.'
                      : 'Create a new journal entry.',

                  style: FinanceText.body(size: 13, color: Colors.black87),
                ),

                const SizedBox(height: 34),

                TextFormField(
                  controller: _title,

                  decoration: journalInputDecoration('Reflection Title'),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a reflection title';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 8),

                TextFormField(
                  controller: _description,

                  minLines: 4,

                  maxLines: 7,

                  decoration: journalInputDecoration('Description (Optional)'),
                ),

                const SizedBox(height: 8),

                _dropdown(
                  hint: 'Reflection Domain/ Category',

                  value: _category,

                  options: [
                    'Stewardship Reflection',

                    'Gratitude',

                    'Prayer Reflection',

                    'Scripture',
                  ],

                  onChanged: (v) {
                    setState(() {
                      _category = v;
                    });
                  },
                ),

                const SizedBox(height: 8),

                _dropdown(
                  hint: 'Stewardship Dimensions/Tags',

                  value: _tag,

                  options: ['Time', 'Talents', 'Treasure', 'Sabbath'],

                  onChanged: (v) {
                    setState(() {
                      _tag = v;
                    });
                  },
                ),

                const SizedBox(height: 8),

                JournalPickerField(
                  label: _time?.format(context) ?? 'Entry TimeStamp',

                  icon: Icons.access_time,

                  onTap: _pickTime,
                ),

                const SizedBox(height: 8),

                JournalPickerField(
                  label: _date == null
                      ? 'Select Date'
                      : MaterialLocalizations.of(
                          context,
                        ).formatMediumDate(_date!),

                  icon: Icons.calendar_today_outlined,

                  onTap: _pickDate,
                ),

                const SizedBox(height: 28),

                // IMAGE PICKER WIDGET
                const JournalImagePicker(),

                const SizedBox(height: 26),

                JournalCard(
                  padding: const EdgeInsets.all(20),

                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,

                        backgroundColor: Color(0xFFBDCEB8),

                        child: Icon(Icons.lock_outline, color: journalGreen),
                      ),

                      const SizedBox(width: 13),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Only You (Private Vault)',

                              style: FinanceText.subheading(size: 14),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              'Default protected posture',

                              style: FinanceText.body(
                                size: 12,

                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(Icons.check_circle, color: journalGreen),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                JournalButton(
                  label: widget.editing ? 'Update Entry' : 'Save Entry',

                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    FocusScope.of(context).unfocus();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Entry saved')),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
