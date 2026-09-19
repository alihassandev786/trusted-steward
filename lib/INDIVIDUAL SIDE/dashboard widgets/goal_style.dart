import 'package:flutter/material.dart';
import '../teasure_dasbord_widgets/finance_theme.dart';

const goalSage = Color(0xFFBED0B8);
const goalGoldFill = Color(0xFFEEDDAD);

BoxDecoration goalSurface({double radius = 30}) => BoxDecoration(
  color: FinanceColors.card,
  borderRadius: BorderRadius.circular(radius),
  border: Border.all(color: FinanceColors.navBorder),
  boxShadow: const [BoxShadow(color: Color(0x16000000), blurRadius: 4)],
);

InputDecoration goalInput(String hint, {Widget? suffix}) => InputDecoration(
  hintText: hint,
  hintStyle: FinanceText.body(size: 12, color: const Color(0xFF666666)),
  filled: true,
  fillColor: FinanceColors.tileFill,
  contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
  suffixIcon: suffix,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: FinanceColors.green),
  ),
);

String goalDate(BuildContext context, DateTime date) =>
    MaterialLocalizations.of(context).formatMediumDate(date);

String goalTimeLeft(DateTime date) {
  final now = DateTime.now();
  final days = DateTime(
    date.year,
    date.month,
    date.day,
  ).difference(DateTime(now.year, now.month, now.day)).inDays;
  if (days < 0) return 'Overdue';
  if (days == 0) return 'Due today';
  if (days < 7) return '$days days left';
  return '${(days / 7).ceil()} wks left';
}
