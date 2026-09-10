import 'package:flutter/material.dart';

/// Reusable Title Widget
/// Used for screen headings like "Select Your Use!", "Sign Up!", "Sign In!"
/// Supports an optional subtitle line below the main title.
class AppTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextAlign textAlign;
  final Color titleColor;
  final Color subtitleColor;

  const AppTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.textAlign = TextAlign.start,
    this.titleColor = const Color(0xFF1A1A1A),
    this.subtitleColor =  Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: 26,fontFamily: "pops",
            fontWeight: FontWeight.w800,
            color: titleColor,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            textAlign: textAlign,
            style: TextStyle(
              fontSize: 14,fontFamily: "pop",
              fontWeight: FontWeight.w800,
              color: subtitleColor,
              height: 1.4,
            ),
          ),
        ],
      ],
    );
  }
}
