// finance_form_widgets.dart

import 'package:flutter/material.dart';
import 'finance_theme.dart';

BoxDecoration _softCard({double radius = 30}) {
  return FinanceDecorations.card(radius: radius).copyWith(
    border: Border.all(color: FinanceColors.navBorder),
    boxShadow: const [
      BoxShadow(
        color: Color(0x14000000),
        blurRadius: 3,
        spreadRadius: 1,
      ),
    ],
  );
}

class FinancePageHeader extends StatelessWidget {
  const FinancePageHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 45,
          height: 45,
          child: Material(
            color: FinanceColors.green,
            shape: const CircleBorder(),
            child: IconButton(
              tooltip: 'Back',
              onPressed: () => Navigator.maybePop(context),
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: FinanceText.heading(size: 21),
          ),
        ),
      ],
    );
  }
}

class FinanceInput extends StatelessWidget {
  const FinanceInput({
    super.key,
    required this.controller,
    required this.hint,
    this.notes = false,
    this.enabled = true,
    this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final bool notes;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      validator: validator,
      minLines: notes ? 3 : 1,
      maxLines: notes ? 5 : 1,
      textCapitalization: TextCapitalization.sentences,
      keyboardType:
      notes ? TextInputType.multiline : TextInputType.text,
      textInputAction:
      notes ? TextInputAction.newline : TextInputAction.next,
      style: FinanceText.body(
        size: 12,
        color: FinanceColors.textDark,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: FinanceText.body(size: 11),
        filled: true,
        fillColor: FinanceColors.tileFill,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(notes ? 30 : 26),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(notes ? 30 : 26),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(notes ? 30 : 26),
          borderSide: const BorderSide(
            color: FinanceColors.green,
          ),
        ),
        errorStyle: FinanceText.body(
          size: 11,
          color: FinanceColors.danger,
        ),
      ),
    );
  }
}

class TransactionTypeTile extends StatelessWidget {
  const TransactionTypeTile({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: FinanceColors.gold.withOpacity(0.28),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Text(
        label,
        style: FinanceText.body(
          size: 11,
          color: Color(0xff735C00),
        ),
      ),
    );
  }
}

class StewardshipDateField extends StatelessWidget {
  const StewardshipDateField({
    super.key,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  final DateTime? value;
  final ValueChanged<DateTime> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: value,
      validator: (date) {
        return date == null ? 'Please select a date' : null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: FinanceColors.tileFill,
              borderRadius: BorderRadius.circular(26),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: !enabled
                    ? null
                    : () async {
                  FocusScope.of(context).unfocus();

                  final picked = await showDatePicker(
                    context: context,
                    initialDate: field.value ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2200),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.fromSeed(
                            seedColor: FinanceColors.green,
                            surface: FinanceColors.cream,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (picked == null || !field.mounted) return;

                  field.didChange(picked);
                  onChanged(picked);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          field.value == null
                              ? 'Date of Stewardship'
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
                padding: const EdgeInsets.only(
                  left: 18,
                  top: 6,
                ),
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

class RecurringTransactionTile extends StatelessWidget {
  const RecurringTransactionTile({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 13,
      ),
      decoration: _softCard(),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: FinanceColors.green.withOpacity(0.28),
            ),
            child: const Icon(
              Icons.autorenew,
              size: 21,
              color: FinanceColors.green,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              'Recurring Transaction',
              style: FinanceText.subheading(size: 14),
            ),
          ),
          Semantics(
            label: 'Recurring transaction',
            child: Switch.adaptive(
              value: value,
              activeColor: FinanceColors.green,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class SaveTransactionButton extends StatelessWidget {
  const SaveTransactionButton({
    super.key,
    required this.busy,
    required this.onPressed,
  });

  final bool busy;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: busy ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: FinanceColors.green,
          foregroundColor: Colors.white,
          disabledBackgroundColor:
          FinanceColors.green.withOpacity(0.6),
          minimumSize: const Size.fromHeight(46),
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 13,
          ),
          shape: const StadiumBorder(),
        ),
        child: busy
            ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : Text(
          'Save Transaction',
          style: FinanceText.subheading(
            size: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}