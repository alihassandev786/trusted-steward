import 'package:flutter/material.dart';

/// Reusable Text Field Widget
/// Used for Full Name, Email, Password, Username fields etc.
/// Pass `isPassword: true` to get a built-in eye icon that toggles obscureText.
class AppTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final Color fillColor;

  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.fillColor = const Color(0xFFEDE8DC),
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscure : false,
      keyboardType: widget.keyboardType,
      style: const TextStyle(fontSize: 15, color: Color(0xFF1A1A1A)),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF8A8A8A),
          fontSize: 15,
          fontFamily: "pop",
        ),
        filled: true,
        fillColor: widget.fillColor,

        contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        isDense: true,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 32,
          minHeight: 32,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_off_outlined : Icons.visibility,
            color: const Color(0xFF306C3F),
            size: 20,
          ),
          onPressed: () => setState(() => _obscure = !_obscure),
          // Without these, IconButton forces a 48x48 minimum tap
          // target, which stops the field from getting any shorter.
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minWidth: 32,
            minHeight: 32,
          ),
          visualDensity: VisualDensity.compact,
          splashRadius: 18,
        )
            : null,
      ),
    );
  }
}

/// Reusable checkbox + label row
/// Used for "I agree with terms..." and "Remember Me"
class AppCheckboxLabel extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Widget label;

  const AppCheckboxLabel({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onChanged(!value),
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: value ? const Color(0xFF306C3F) : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: value ? const Color(0xFF306C3F) : const Color(0xFFBFBFBF),
                width: 1.5,
              ),
            ),
            child: value
                ? const Icon(Icons.check, size: 14, color: Colors.white)
                : null,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: label),
      ],
    );
  }
}