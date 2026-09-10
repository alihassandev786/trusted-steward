import 'package:flutter/material.dart';

import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_button.dart';
import '../../../INDIVIDUAL SIDE/learn_screen_widgets/learn_theme.dart';
import '../../../INDIVIDUAL SIDE/teasure_dasbord_widgets/detail_screen_header.dart';

class AddTalentScreen extends StatefulWidget {
  const AddTalentScreen({
    super.key,
    this.onSave,
  });

  final Future<void> Function(Map<String, String> talent)? onSave;

  @override
  State<AddTalentScreen> createState() => _AddTalentScreenState();
}

class _AddTalentScreenState extends State<AddTalentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _categoryFieldKey = GlobalKey<FormFieldState<String>>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  final List<String> _categories = [
    'Art & Creativity',
    'Music',
    'Sports',
    'Reading & Learning',
    'Other',
  ];

  final List<Map<String, String>> _ideas = [
    {
      'label': '🎨 Drawing',
      'name': 'Drawing',
      'category': 'Art & Creativity',
    },
    {
      'label': '♫ Music',
      'name': 'Music',
      'category': 'Music',
    },
    {
      'label': '⚽ Soccer',
      'name': 'Soccer',
      'category': 'Sports',
    },
    {
      'label': '📖 Reading',
      'name': 'Reading',
      'category': 'Reading & Learning',
    },
  ];

  String? _category;
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  InputDecoration _decoration(String? hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: learnText(
        11,
        color: Colors.black54,
      ),
      filled: true,
      fillColor: const Color(0xFFECE8D8),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 15,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: learnGreen),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
    );
  }

  void _selectCategory(String? value) {
    setState(() {
      _category = value;
    });

    final field = _categoryFieldKey.currentState;
    field?.didChange(value);

    if (field != null && field.hasError) {
      field.validate();
    }
  }

  Future<void> _saveTalent() async {
    if (_saving || !_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    final talent = <String, String>{
      'title': _nameController.text.trim(),
      'description': _descriptionController.text.trim(),
      'category': _category!,
    };

    setState(() => _saving = true);

    try {
      final save = widget.onSave;

      if (save != null) {
        await save(talent);
      }

      if (!mounted) return;

      Navigator.pop(context, talent);
    } catch (_) {
      if (!mounted) return;

      setState(() => _saving = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not add talent. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: DetailScreenHeader(
                        title: 'Add New Talent',
                        onBackTap: () {
                          if (!_saving) {
                            Navigator.maybePop(context);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          top: 48,
                          bottom: 40 + MediaQuery.of(context).padding.bottom,
                        ),
                        decoration: BoxDecoration(
                          color: learnCream,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(70),
                          ),
                          border: Border.all(
                            color: Colors.black.withValues(alpha: 0.08),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 5,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        'Discover and nurture the special gifts '
                                            'God gave you.',
                                        style: learnText(12),
                                      ),
                                    ),
                                    const SizedBox(height: 34),
                                    TextFormField(
                                      controller: _nameController,
                                      enabled: !_saving,
                                      textCapitalization:
                                      TextCapitalization.words,
                                      textInputAction: TextInputAction.next,
                                      style: learnText(12),
                                      decoration: _decoration(
                                        'Talent or Interest',
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Enter a talent or interest';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    TextFormField(
                                      controller: _descriptionController,
                                      enabled: !_saving,
                                      minLines: 3,
                                      maxLines: 5,
                                      textCapitalization:
                                      TextCapitalization.sentences,
                                      style: learnText(12),
                                      decoration: _decoration(
                                        'Description (Optional)',
                                      ),
                                    ),
                                    const SizedBox(height: 26),
                                    Text(
                                      'Quick Ideas to Pick',
                                      style: learnText(
                                        16,
                                        weight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Full-width scroll row, without side padding.
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    for (int i = 0; i < _ideas.length; i++) ...[
                                      if (i > 0) const SizedBox(width: 10),
                                      Material(
                                        color: const Color(0xFFECE8D8),
                                        borderRadius:
                                        BorderRadius.circular(25),
                                        clipBehavior: Clip.antiAlias,
                                        child: InkWell(
                                          onTap: _saving
                                              ? null
                                              : () {
                                            final idea = _ideas[i];

                                            _nameController.text =
                                            idea['name']!;

                                            _selectCategory(
                                              idea['category'],
                                            );
                                          },
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 18,
                                              vertical: 14,
                                            ),
                                            child: Text(
                                              _ideas[i]['label']!,
                                              style: learnText(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),

                              const SizedBox(height: 24),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    FormField<String>(
                                      key: _categoryFieldKey,
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Choose a category';
                                        }
                                        return null;
                                      },
                                      builder: (field) {
                                        return InputDecorator(
                                          isEmpty: _category == null,
                                          decoration:
                                          _decoration(null).copyWith(
                                            errorText: field.errorText,
                                            contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 18,
                                              vertical: 2,
                                            ),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: _category,
                                              isExpanded: true,
                                              hint: Text(
                                                'Choose Category',
                                                style: learnText(
                                                  11,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: learnGreen,
                                              ),
                                              dropdownColor: learnCream,
                                              style: learnText(12),
                                              items: [
                                                for (final category
                                                in _categories)
                                                  DropdownMenuItem<String>(
                                                    value: category,
                                                    child: Text(category),
                                                  ),
                                              ],
                                              onChanged: _saving
                                                  ? null
                                                  : _selectCategory,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 46),
                                    LearnButton(
                                      label:
                                      _saving ? 'Adding...' : 'Add Talent',
                                      onPressed: _saving ? null : _saveTalent,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}