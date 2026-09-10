import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;
  final double height;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF306C3F),
    this.textColor = Colors.white,
    this.isLoading = false,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  fontSize: 16,fontFamily: "pop",
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}

/// Reusable text-link style widget
/// Used for "Already have an account? Sign In" style bottom links
class AppTextLinkButton extends StatefulWidget {
  final String normalText;
  final String linkText;
  final VoidCallback onPressed;

  const AppTextLinkButton({
    super.key,
    required this.normalText,
    required this.linkText,
    required this.onPressed,
  });

  @override
  State<AppTextLinkButton> createState() => _AppTextLinkButtonState();
}

class _AppTextLinkButtonState extends State<AppTextLinkButton> {
  late final TapGestureRecognizer _recognizer;

  @override
  void initState() {
    super.initState();
    _recognizer = TapGestureRecognizer()..onTap = widget.onPressed;
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: '${widget.normalText} ',
          style: const TextStyle(color: Colors.black, fontFamily:"pop",fontSize: 14),
          children: [
            TextSpan(
              text: widget.linkText,
              style: const TextStyle(
                color: Color(0xFF306C3F),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              recognizer: _recognizer,
            ),
          ],
        ),
      ),
    );
  }
}
