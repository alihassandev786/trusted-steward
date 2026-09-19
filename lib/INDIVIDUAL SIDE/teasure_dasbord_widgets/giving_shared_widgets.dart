import 'package:flutter/material.dart';
import 'finance_theme.dart';
import 'finance_form_widgets.dart';

class FinanceScreenLayout extends StatelessWidget {
  const FinanceScreenLayout({
    super.key,
    required this.title,
    required this.summary,
    required this.child,
    this.formPanel = true,
    this.panelGap = 18,
  });

  final String title;
  final Widget summary;
  final Widget child;
  final bool formPanel;
  final double panelGap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FinanceColors.background,
      body: SafeArea(
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
                      child: FinancePageHeader(title: title),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 44, 20, 0),
                      child: summary,
                    ),
                    SizedBox(height: panelGap),
                    if (formPanel)
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 44, 20, 26),
                        decoration: BoxDecoration(
                          color: FinanceColors.card,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(68),
                          ),
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        child: child,
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
                        child: child,
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

class FinanceChoiceField<T> extends StatelessWidget {
  const FinanceChoiceField({
    super.key,
    required this.hint,
    required this.items,
    required this.onChanged,
    required this.labelBuilder,
    this.value,
    this.validator,
  });

  final String hint;
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String Function(T) labelBuilder;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      isExpanded: true,
      dropdownColor: FinanceColors.card,
      borderRadius: BorderRadius.circular(24),
      style: FinanceText.body(
        size: 12,
        color: FinanceColors.textDark,
      ),
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FinanceColors.green,
        size: 22,
      ),
      hint: Text(hint, style: FinanceText.body(size: 11)),
      decoration: InputDecoration(
        filled: true,
        fillColor: FinanceColors.tileFill,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide.none,
        ),
      ),
      items: items.toSet().map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            labelBuilder(item),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator ??
              (value) => value == null ? 'Please select an option' : null,
    );
  }
}

class SavingsTargetDateField extends StatelessWidget {
  const SavingsTargetDateField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final DateTime? value;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: value,
      validator: (date) => date == null ? 'Please select a date' : null,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: FinanceColors.tileFill,
              borderRadius: BorderRadius.circular(26),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  final now = DateUtils.dateOnly(DateTime.now());
                  final selected = await showDatePicker(
                    context: context,
                    initialDate: field.value ?? now,
                    firstDate: now,
                    lastDate: DateTime(now.year + 100),
                  );

                  if (selected == null || !field.mounted) return;
                  field.didChange(selected);
                  onChanged(selected);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          field.value == null
                              ? 'Target Horizon'
                              : MaterialLocalizations.of(context)
                              .formatMediumDate(field.value!),
                          style: FinanceText.body(size: 11),
                        ),
                      ),
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 15,
                        color: FinanceColors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 6),
                child: Text(
                  field.errorText!,
                  style: FinanceText.body(
                    size: 11,
                    color: FinanceColors.danger,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class FinanceActionButton extends StatelessWidget {
  const FinanceActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: FinanceColors.green,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(46),
          elevation: 0,
          shape: const StadiumBorder(),
        ),
        child: Text(
          label,
          style: FinanceText.subheading(
            size: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class GivingDetailRow extends StatelessWidget {
  const GivingDetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: FinanceText.subheading(
                size: 14,
                weight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: FinanceText.body(
                size: 12,
                color: const Color(0xFF555555),
              ),
            ),
          ),
        ],
      ),
    );
  }
}