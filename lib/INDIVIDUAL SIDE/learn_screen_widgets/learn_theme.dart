import 'package:flutter/material.dart';
import '../teasure_dasbord_widgets/finance_theme.dart';

const learnGreen = Color(0xFF306C3F);
const learnGold = Color(0xFFD2A52D);
const learnCream = Color(0xFFF6F2E6);
const learnBackground = Color(0xFFF9F8F2);
const learnIconBackground = Color(0xFFBDCEB6);

TextStyle learnText(
    double size, {
      Color color = const Color(0xFF252525),
      FontWeight weight = FontWeight.w400,
    }) {
  return FinanceText.body(
    size: size,
    color: color,
    weight: weight,
  );
}