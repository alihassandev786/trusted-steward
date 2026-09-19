import 'package:flutter/material.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';


const talentSage = Color(0xFFBED0B8);
const talentGoldFill = Color(0xFFEEDDAD);
const talentGoldInk = Color(0xFF806600);

BoxDecoration talentSurface({double radius = 30}) => BoxDecoration(
  color: FinanceColors.card,
  borderRadius: BorderRadius.circular(radius),
  border: Border.all(color: FinanceColors.navBorder),
  boxShadow: const [BoxShadow(color: Color(0x16000000), blurRadius: 4)],
);

InputDecoration talentInput(String hint, {Widget? suffix}) => InputDecoration(
  hintText: hint,
  hintStyle: FinanceText.body(size: 12, color: const Color(0xFF666666)),
  filled: true,
  fillColor: FinanceColors.tileFill,
  contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
  suffixIcon: suffix,
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: BorderSide.none),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: BorderSide.none),
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: const BorderSide(color: FinanceColors.green)),
  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: const BorderSide(color: FinanceColors.danger)),
);
