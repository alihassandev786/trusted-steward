import 'package:flutter/material.dart';

class AppShadows {
  static List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Colors.black87.withOpacity(0.3),
      blurRadius: 2,
      spreadRadius: 0.1,
      offset: const Offset(0, 0.5),
    ),
  ];
}