import 'package:flutter/material.dart';

import '../../dashboard widgets/talent_button.dart';
import '../../dashboard widgets/talent_form_panel.dart';
import '../../dashboard widgets/talent_models.dart';
import '../../dashboard widgets/talent_page.dart';
import '../../dashboard widgets/talent_style.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';
import 'add_talent_screen.dart';

class AddDevelopmentActivityScreen extends StatefulWidget {
  const AddDevelopmentActivityScreen({
    super.key,
    required this.controller,
    this.initialTalentId,
  });

  final TalentsController controller;
  final String? initialTalentId;

  @override
  State<AddDevelopmentActivityScreen> createState() =>
      _AddDevelopmentActivityScreenState();
}

class _AddDevelopmentActivityScreenState
    extends State<AddDevelopmentActivityScreen> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _reflection = TextEditingController();
  final _dateText = TextEditingController();
  final _minutes = TextEditingController();
  String? _talentId;
  String? _modality;
  DateTime? _date;

  @override
  void initState() {
    super.initState();
    final talents = widget.controller.talents;
    _talentId = talents.any((item) => item.id == widget.initialTalentId)
        ? widget.initialTalentId
        : (talents.isEmpty ? null : talents.first.id);
  }

  @override
  void dispose() {
    _title.dispose();
    _reflection.dispose();
    _dateText.dispose();
    _minutes.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final result = await showDatePicker(
      context: context,
      initialDate: _date ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(now.year + 10, 12, 31),
    );
    if (result == null || !mounted) return;
    setState(() {
      _date = result;
      _dateText.text = MaterialLocalizations.of(
        context,
      ).formatMediumDate(result);
    });
  }

  void _save() {
    if (!_form.currentState!.validate()) return;
    final activity = TalentActivity(
      title: _title.text.trim(),
      modality: _modality!,
      date: _date!,
      minutes: int.parse(_minutes.text.trim()),
      reflection: _reflection.text.trim(),
    );
    widget.controller.addActivity(_talentId!, activity);
    Navigator.of(context).pop(activity);
  }

  @override
  Widget build(BuildContext context) => TalentPage(
    title: 'New Activity',
    child: AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        if (widget.controller.talents.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add a talent before logging an activity.',
                  style: FinanceText.subheading(),
                ),
                const SizedBox(height: 24),
                TalentButton(
                  label: 'Add New Talent',
                  onPressed: () async {
                    final talent = await Navigator.of(context).push<Talent>(
                      MaterialPageRoute(
                        builder: (_) =>
                            AddTalentScreen(controller: widget.controller),
                      ),
                    );
                    if (mounted && talent != null)
                      setState(() => _talentId = talent.id);
                  },
                ),
              ],
            ),
          );
        }
        return TalentFormPanel(
          topGap: 104,
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fostered Talent',
                  style: FinanceText.body(color: FinanceColors.text),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _talentId,
                  isExpanded: true,
                  decoration: talentInput(
                    'Choose talent',
                  ).copyWith(fillColor: talentGoldFill),
                  style: FinanceText.body(size: 12, color: talentGoldInk),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: FinanceColors.green,
                  ),
                  items: widget.controller.talents
                      .map(
                        (talent) => DropdownMenuItem(
                          value: talent.id,
                          child: Text(
                            talent.name,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => setState(() => _talentId = value),
                  validator: (value) =>
                      value == null ? 'Choose a talent' : null,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _title,
                  style: FinanceText.body(color: FinanceColors.text),
                  decoration: talentInput('Activity Title'),
                  textInputAction: TextInputAction.next,
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Enter an activity title'
                      : null,
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: talentInput('Activity Modality'),
                  style: FinanceText.body(size: 12, color: FinanceColors.text),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: FinanceColors.green,
                  ),
                  items:
                      const [
                            'Practice',
                            'Reading',
                            'Mentoring',
                            'Workshop',
                            'Service',
                            'Other',
                          ]
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                  onChanged: (value) => setState(() => _modality = value),
                  validator: (value) =>
                      value == null ? 'Choose an activity modality' : null,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _dateText,
                  readOnly: true,
                  onTap: _pickDate,
                  style: FinanceText.body(color: FinanceColors.text),
                  decoration: talentInput(
                    'Select Date',
                    suffix: const Icon(
                      Icons.calendar_today_outlined,
                      color: FinanceColors.green,
                      size: 18,
                    ),
                  ),
                  validator: (_) => _date == null ? 'Select a date' : null,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _minutes,
                  keyboardType: TextInputType.number,
                  style: FinanceText.body(color: FinanceColors.text),
                  decoration: talentInput(
                    'Time Dedicated (minutes)',
                    suffix: const Icon(
                      Icons.schedule,
                      color: FinanceColors.green,
                      size: 18,
                    ),
                  ),
                  validator: (value) {
                    final minutes = int.tryParse(value?.trim() ?? '');
                    return minutes == null || minutes <= 0
                        ? 'Enter a positive whole number of minutes'
                        : null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _reflection,
                  minLines: 2,
                  maxLines: 5,
                  style: FinanceText.body(color: FinanceColors.text),
                  decoration: talentInput('Intentional Reflection.....'),
                ),
                const SizedBox(height: 16),
                TalentButton(label: 'Save Activity', onPressed: _save),
              ],
            ),
          ),
        );
      },
    ),
  );
}
