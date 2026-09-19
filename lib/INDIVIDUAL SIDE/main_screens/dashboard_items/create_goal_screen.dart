import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../dashboard widgets/goal_button.dart';
import '../../dashboard widgets/goal_cover_picker.dart';
import '../../dashboard widgets/goal_models.dart' hide GoalCoverPicker;
import '../../dashboard widgets/goal_page.dart';
import '../../dashboard widgets/goal_style.dart';
import '../../teasure_dasbord_widgets/finance_theme.dart';

class CreateGoalScreen extends StatefulWidget {
  const CreateGoalScreen({
    super.key,
    required this.controller,
    this.onPickCover,
  });

  final GoalsController controller;

  // Optional custom picker. By default, the device gallery opens.
  final Future<ImageProvider?> Function()? onPickCover;

  @override
  State<CreateGoalScreen> createState() => _CreateGoalScreenState();
}

class _CreateGoalScreenState extends State<CreateGoalScreen> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _target = TextEditingController();
  final _dateText = TextEditingController();
  final _imagePicker = ImagePicker();

  String? _category;
  String? _unit;
  DateTime? _date;
  ImageProvider? _cover;
  bool _picking = false;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb &&
        defaultTargetPlatform == TargetPlatform.android &&
        widget.onPickCover == null) {
      _recoverImage();
    }
  }

  @override
  void dispose() {
    _title.dispose();
    _target.dispose();
    _dateText.dispose();
    super.dispose();
  }

  ThemeData _screenTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: FinanceColors.background,
      canvasColor: FinanceColors.card,
      colorScheme: ColorScheme.fromSeed(
        seedColor: FinanceColors.green,
        brightness: Brightness.light,
      ).copyWith(
        primary: FinanceColors.green,
        onPrimary: Colors.white,
        secondary: FinanceColors.gold,
        onSecondary: FinanceColors.text,
        surface: FinanceColors.card,
        onSurface: FinanceColors.text,
        error: FinanceColors.danger,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: FinanceColors.green,
        selectionColor: Color(0x552D5A3D),
        selectionHandleColor: FinanceColors.green,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: FinanceColors.card,
        surfaceTintColor: Colors.transparent,
        headerBackgroundColor: FinanceColors.green,
        headerForegroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: FinanceColors.green,
          textStyle: FinanceText.subheading(size: 13),
        ),
      ),
    );
  }

  void _showError(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _recoverImage() async {
    setState(() => _picking = true);

    try {
      final response = await _imagePicker.retrieveLostData();
      final files = response.files;

      if (files != null && files.isNotEmpty) {
        final bytes = await files.first.readAsBytes();

        if (mounted) {
          setState(() => _cover = MemoryImage(bytes));
        }
      } else if (response.exception != null) {
        _showError('Could not restore the selected image.');
      }
    } catch (_) {
      _showError('Could not restore the selected image.');
    } finally {
      if (mounted) {
        setState(() => _picking = false);
      }
    }
  }

  Future<void> _pickCover() async {
    if (_picking) return;

    FocusScope.of(context).unfocus();
    setState(() => _picking = true);

    try {
      ImageProvider? selectedImage;

      if (widget.onPickCover != null) {
        selectedImage = await widget.onPickCover!();
      } else {
        final file = await _imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 85,
          maxWidth: 1600,
          requestFullMetadata: false,
        );

        if (file != null) {
          final bytes = await file.readAsBytes();
          selectedImage = MemoryImage(bytes);
        }
      }

      if (mounted && selectedImage != null) {
        setState(() => _cover = selectedImage);
      }
    } catch (_) {
      _showError('Could not load the image. Please try again.');
    } finally {
      if (mounted) {
        setState(() => _picking = false);
      }
    }
  }

  Future<void> _pickDate() async {
    FocusScope.of(context).unfocus();

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final initialDate =
    _date != null && !_date!.isBefore(today) ? _date! : today;

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: today,
      lastDate: DateTime(now.year + 20, 12, 31),
      builder: (context, child) {
        return Theme(
          data: _screenTheme(context),
          child: child!,
        );
      },
    );

    if (!mounted || picked == null) return;

    setState(() {
      _date = picked;
      _dateText.text = goalDate(context, picked);
    });
  }

  void _save() {
    if (_picking) return;
    if (!(_form.currentState?.validate() ?? false)) return;

    if (_cover == null) {
      _showError('Please select a cover image.');
      return;
    }

    final goal = StewardshipGoal(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: _title.text.trim(),
      category: _category!,
      target: int.parse(_target.text.trim()),
      unit: _unit!,
      dueDate: _date!,
      cover: _cover!,
    );

    widget.controller.add(goal);
    Navigator.of(context).pop(goal);
  }

  Widget _dropdown({
    required String hint,
    required List<String> options,
    required ValueChanged<String?> onChanged,
    required String validationMessage,
  }) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      dropdownColor: FinanceColors.card,
      borderRadius: BorderRadius.circular(22),
      menuMaxHeight: 320,
      elevation: 3,
      decoration: goalInput(hint),
      style: FinanceText.body(
        size: 12,
        color: FinanceColors.text,
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: FinanceColors.green,
      ),
      items: options.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? validationMessage : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _screenTheme(context),
      child: GoalPage(
        title: 'New Goal',
        child: LayoutBuilder(
          builder: (context, constraints) {
            const topGap = 80.0;
            final panelHeight = constraints.maxHeight > topGap
                ? constraints.maxHeight - topGap
                : 0.0;

            return SingleChildScrollView(
              keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: topGap),
              child: Container(
                width: double.infinity,

                // Panel fills the remaining height and grows with content.
                constraints: BoxConstraints(
                  minHeight: panelHeight,
                ),
                padding: const EdgeInsets.fromLTRB(20, 46, 20, 24),
                decoration: const BoxDecoration(
                  color: FinanceColors.card,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(68),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(color: FinanceColors.navBorder),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          'Create your new goal!',
                          style: FinanceText.body(
                            color: FinanceColors.text,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      GoalCoverPicker(
                        image: _cover,
                        onTap: _pickCover,
                        busy: _picking,
                        hasDevicePicker: true,
                      ),
                      const SizedBox(height: 36),

                      TextFormField(
                        controller: _title,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        decoration: goalInput('Goal Title'),
                        style: FinanceText.body(
                          color: FinanceColors.text,
                        ),
                        validator: (value) {
                          return value == null || value.trim().isEmpty
                              ? 'Enter a goal title'
                              : null;
                        },
                      ),
                      const SizedBox(height: 8),

                      _dropdown(
                        hint: 'Goal Category',
                        options: const [
                          'Faith & Wisdom',
                          'Faith',
                          'Family',
                          'Learning',
                          'Giving',
                          'Wellbeing',
                        ],
                        onChanged: (value) {
                          setState(() => _category = value);
                        },
                        validationMessage: 'Choose a category',
                      ),
                      const SizedBox(height: 8),

                      _dropdown(
                        hint: 'Target Measurable Outcome',
                        options: const [
                          'Sessions',
                          'Modules',
                          'Lessons',
                          'USD',
                        ],
                        onChanged: (value) {
                          setState(() => _unit = value);
                        },
                        validationMessage: 'Choose a measurable outcome',
                      ),

                      if (_unit != null) ...[
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _target,
                          keyboardType: TextInputType.number,
                          decoration: goalInput('Target amount ($_unit)'),
                          style: FinanceText.body(
                            color: FinanceColors.text,
                          ),
                          validator: (value) {
                            final number = int.tryParse(
                              value?.trim() ?? '',
                            );
                            return number == null || number <= 0
                                ? 'Enter a positive whole number'
                                : null;
                          },
                        ),
                      ],
                      const SizedBox(height: 8),

                      TextFormField(
                        controller: _dateText,
                        readOnly: true,
                        onTap: _pickDate,
                        style: FinanceText.body(
                          color: FinanceColors.text,
                        ),
                        decoration: goalInput(
                          'Target Horizon Date',
                          suffix: const Icon(
                            Icons.calendar_today_outlined,
                            size: 18,
                            color: FinanceColors.green,
                          ),
                        ),
                        validator: (_) =>
                        _date == null ? 'Select a target date' : null,
                      ),
                      const SizedBox(height: 54),

                      GoalButton(
                        label: 'Create Goal',
                        onPressed: _picking ? null : _save,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}