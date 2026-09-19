import 'package:flutter/material.dart';

import '../teasure_dasbord_widgets/finance_theme.dart';


typedef StewardshipAsk = Future<String> Function(String question);

const stewardshipDisclaimer = 'AI guidance may be imperfect and is not financial, legal, '
    'medical, pastoral, or other professional advice. '
    'Trusted Steward does not present AI as spiritual authority.';
const stewardshipInkGold = Color(0xFF806600);
const stewardshipNotice = Color(0xFFF0E2BB);
const stewardshipNote = Color(0xFFEEDDAD);

BoxDecoration stewardshipSurface({double radius = 30, Color? color}) => BoxDecoration(
  color: color ?? FinanceColors.card,
  borderRadius: BorderRadius.circular(radius),
  border: Border.all(color: FinanceColors.navBorder),
  boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 4)],
);
