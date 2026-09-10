import 'package:flutter/material.dart';

/// Colors sampled to match the reference dashboard design exactly.
class AppPalette {
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

class AppTextStyles {
  static const heading = TextStyle(
    fontSize: 18,
    fontFamily: "pops",
    fontWeight: FontWeight.w800,
    color: AppPalette.text,
  );

  static const title = TextStyle(
    fontSize: 15,
    fontFamily: "popp",
    fontWeight: FontWeight.w700,
    color: AppPalette.text,
  );

  static const subtitle = TextStyle(
    fontSize: 12,
    fontFamily: "popp",
    color: AppPalette.muted,
  );
static const timetrack = TextStyle(
    fontSize: 12,
    fontFamily: "popp",
    color: AppPalette.green,
  );
static const week = TextStyle(
    fontSize: 20,
    fontFamily: "popp",fontWeight: FontWeight.w800,
    color: AppPalette.text,
  );

  static const body = TextStyle(
    fontSize: 13,
    fontFamily: "pop",
    color: AppPalette.muted,
    height: 1.5,
  );

  // ---- Extra styles used by the new screens (kept in the same family) ----

  static const button = TextStyle(
    fontSize: 15,
    fontFamily: "popp",
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const fieldHint = TextStyle(
    fontSize: 13.5,
    fontFamily: "pop",
    color: Colors.black45,
  );

  static const fieldValue = TextStyle(
    fontSize: 13.5,
    fontFamily: "pop",
    color: AppPalette.text,
  );

  static const dayLabel = TextStyle(
    fontSize: 12,
    fontFamily: "pop",
    fontWeight: FontWeight.w600,
    color: Colors.black45,
  );

  static const dateNumber = TextStyle(
    fontSize: 13.5,
    fontFamily: "pop",
    color: AppPalette.text,
  );

  static const percent = TextStyle(
    fontSize: 12,
    fontFamily: "popp",
    fontWeight: FontWeight.w800,
    color: AppPalette.text,
  );
}
