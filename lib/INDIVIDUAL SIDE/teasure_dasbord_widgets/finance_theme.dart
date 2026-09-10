import 'package:flutter/material.dart';

/// Shared color palette for the Treasure/Income/Expenses screens.
class FinanceColors {
  FinanceColors._();


  static const Color card = Color(0xFFF6F2E6);

  static const Color darkGreen = Color(0xFF2D5A3D);
  static const Color textDark = Color(0xFF1B1B1B);
  static const Color textMuted = Color(0xFF8D8A7E);
  static const Color progressTrack = Color(0xFFCFCBBC);
  static const Color navBorder = Color(0xFFE4DFCF);
  static const cream = Color(0xFFF6F2E6);
  static const green = Color(0xFF2D5A3D);
  static const gold = Color(0xFFCFA02C);
  static const text = Color(0xFF2B2B2B);
  static const muted = Colors.black;
  static const cardFill = Color(0xFFF6F2E6);
  static const tileFill = Color(0xFFEFE9D6);
  static const iconBg = Color(0xFFE1DEC2);
  static const track = Color(0xFFDAD5BE);
  static const border = Color(0xFFE7E0C8);
  static const danger = Color(0xFFC0392B);
  static const background = Color(0xffF9F8F2);
}

/// Text styles for the finance screens — 'Pops' for screen headings,
/// 'Popp' for normal/body text (both already registered in pubspec.yaml).
class FinanceText {
  FinanceText._();

  /// Screen headings (e.g. "Income", "Categories", "Treasure Dashboard").
  static TextStyle heading({double size = 20, Color? color}) {
    return TextStyle(
      fontFamily: 'Pops',
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color ?? FinanceColors.textDark,
    );
  }

  /// Row/card titles — semibold by default, weight overridable.
  static TextStyle subheading({
    double size = 15,
    Color? color,
    FontWeight weight = FontWeight.w600,
  }) {
    return TextStyle(
      fontFamily: 'Popp',
      fontSize: size,
      fontWeight: weight,
      color: color ?? FinanceColors.textDark,
    );
  }

  /// Normal/body text — regular weight.
  static TextStyle body({
    double size = 13,
    Color? color,
    FontWeight weight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: 'Popp',
      fontSize: size,
      fontWeight: weight,
      color: color ?? FinanceColors.textMuted,
    );
  }

  /// Big gold amounts (e.g. "$6,500").
  static TextStyle amountLarge({double size = 30, Color? color}) {
    return TextStyle(
      fontFamily: 'Pops',
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color ?? FinanceColors.gold,
    );
  }
}

/// Shared box decorations — light (cream) containers get rounded corners
/// in the 25–30 range plus a thin gold border; dark (green) containers
/// stay borderless.
class FinanceDecorations {
  FinanceDecorations._();

  static BoxDecoration card({double radius = 28}) {
    return BoxDecoration(
      color: FinanceColors.card,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: FinanceColors.gold, width: 1.2),
    );
  }

  static BoxDecoration dark({double radius = 26}) {
    return BoxDecoration(
      color: FinanceColors.darkGreen,
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
