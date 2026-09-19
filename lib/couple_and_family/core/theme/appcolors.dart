import 'package:flutter/material.dart';
class AppColors {
  AppColors._();

  // ---------------- Primary ----------------
  static const Color primary1 = Color(0xff306C3F);
  static const Color primary2 = Color(0x4D306C3F);

// ---------------- Secondary ----------------
  static const Color secondary1 = Color(0xffF6F2E6);
  static const Color shadow = Color(0X4D1E1E1E4D);


  static const Color textcolor1 = Colors.black;
  static const Color textcolor2 = Colors.black87;





// ---------------- BaceColor ----------------
  static const Color background = Colors.white;

// ---------------- Status ----------------
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xffC79C3E);
  static const Color error = Color(0xFFD32F2F);
  static const Color info = Color(0xFF1976D2);
}
class DashboardStyle {
  DashboardStyle._();

  static const background = Color(0xFFF9F8F2);
  static const card = Color(0xFFF6F2E6);
  static const green = Color(0xFF306C3F);
  static const gold = Color(0xFFD1A436);
  static const sage = Color(0xFFBBCAB4);
  static const text = Color(0xFF1E1E1E);
  static const muted = Color(0xFF575757);
  static const border = Color(0xFFE1E0D9);
  static const progressTrack = Color(0xFF898989);
  static const inactive = Color(0xFFC4C4C4);

  static const heading = TextStyle(
    fontFamily: 'pb', fontSize: 16, fontWeight: FontWeight.w700,
    height: 1.5, color: text,
  );
  static const title = TextStyle(
    fontFamily: 'pm', fontSize: 14, fontWeight: FontWeight.w600,
    height: 1.5, color: text,
  );
  static const body = TextStyle(
    fontFamily: 'pr', fontSize: 13, height: 1.5, color: text,
  );
  static const small = TextStyle(
    fontFamily: 'pr', fontSize: 12, height: 1.5, color: text,
  );
}