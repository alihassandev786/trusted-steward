import 'package:flutter/material.dart';
import '../../dashboard widgets/talent_button.dart';
import '../../dashboard widgets/talent_form_panel.dart';
import '../../dashboard widgets/talent_models.dart';
import '../../dashboard widgets/talent_page.dart';
import '../../dashboard widgets/talent_style.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';


class AddTalentScreen extends StatefulWidget {
  const AddTalentScreen({super.key, required this.controller});

  final TalentsController controller;

  @override
  State<AddTalentScreen> createState() => _AddTalentScreenState();
}

class _AddTalentScreenState extends State<AddTalentScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _description = TextEditingController();
  String? _category;

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    super.dispose();
  }

  void _save() {
    if (!_form.currentState!.validate()) return;
    final talent = Talent(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: _name.text.trim(),
      category: _category!,
      description: _description.text.trim(),
    );
    widget.controller.addTalent(talent);
    Navigator.of(context).pop(talent);
  }

  @override
  Widget build(BuildContext context) => TalentPage(
    title: 'Add New Talent',
    child: TalentFormPanel(
      child: Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Discover and nurture the special gifts\nGod gave you.',
                textAlign: TextAlign.center,
                style: FinanceText.body(color: FinanceColors.text),
              ),
            ),
            const SizedBox(height: 34),
            TextFormField(
              controller: _name,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              style: FinanceText.body(color: FinanceColors.text),
              decoration: talentInput('Talent or Interest'),
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Enter a talent or interest'
                  : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _description,
              minLines: 3,
              maxLines: 5,
              style: FinanceText.body(color: FinanceColors.text),
              decoration: talentInput('Description (Optional)'),
            ),
            const SizedBox(height: 28),
            Text('Quick Ideas to Pick', style: FinanceText.heading(size: 16)),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final idea in const [
                    '🎨 Drawing',
                    '♫ Music',
                    '⚽ Soccer',
                    '📖 Reading',
                  ])
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ActionChip(
                        label: Text(
                          idea,
                          style: FinanceText.body(
                            size: 12,
                            color: FinanceColors.text,
                          ),
                        ),
                        backgroundColor: FinanceColors.tileFill,
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 10,
                        ),
                        onPressed: () =>
                            _name.text = idea.substring(idea.indexOf(' ') + 1),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: talentInput('Choose Category'),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: FinanceColors.green,
              ),
              style: FinanceText.body(size: 12, color: FinanceColors.text),
              items:
                  const [
                        'Spiritual Growth',
                        'Faith & Wisdom',
                        'Creative Arts',
                        'Service',
                        'Sports',
                        'Other',
                      ]
                      .map(
                        (item) =>
                            DropdownMenuItem(value: item, child: Text(item)),
                      )
                      .toList(),
              onChanged: (value) => setState(() => _category = value),
              validator: (value) => value == null ? 'Choose a category' : null,
            ),
            const SizedBox(height: 46),
            TalentButton(label: 'Add Talent', onPressed: _save),
          ],
        ),
      ),
    ),
  );
}
