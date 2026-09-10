import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/app_button.dart';
import '../widgets/app_title.dart';
import '../widgets/auth_bottom_sheet.dart';
import '../widgets/circle_button.dart';
import 'create_new_password_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  static const _codeLength = 6;

  final _controllers =
  List.generate(_codeLength, (_) => TextEditingController());
  final _focusNodes = List.generate(_codeLength, (_) => FocusNode());
  late final TapGestureRecognizer _resendRecognizer;

  @override
  void initState() {
    super.initState();
    _resendRecognizer = TapGestureRecognizer()..onTap = _resendCode;
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    _resendRecognizer.dispose();
    super.dispose();
  }

  String get _code => _controllers.map((c) => c.text).join();

  void _onDigitChanged(int index, String value) {
    if (value.isNotEmpty && index < _codeLength - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    setState(() {}); // refresh Continue button enabled state
  }

  void _resendCode() {
    // TODO: call your API to resend the verification code
    for (final c in _controllers) {
      c.clear();
    }
    _focusNodes.first.requestFocus();
    setState(() {});
  }

  void _continue() {
    // TODO: verify _code with your API
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const CreateNewPasswordScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF5),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleIconButton(
                  icon: Icons.chevron_left,
                  onTap: () => Navigator.of(context).maybePop(),
                ),
              ),
            ),
            const Spacer(),
            AuthBottomSheet(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppTitle(
                    title: 'Verify Email',
                    subtitle: 'Enter the 6 digit verification code.',
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(_codeLength, (i) {
                      return _OtpBox(
                        controller: _controllers[i],
                        focusNode: _focusNodes[i],
                        onChanged: (value) => _onDigitChanged(i, value),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Didn't receive any code? ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'pop',
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'Resend Code',
                            style: const TextStyle(
                              color: Color(0xFF306C3F),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                            recognizer: _resendRecognizer,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    label: 'Continue',
                    onPressed: _continue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Single square box for one OTP digit.
class _OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const _OtpBox({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 52,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1A1A1A),
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: const Color(0xFFF6F2E6),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFDCD3BC)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFDCD3BC)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF306C3F), width: 1.5),
          ),
        ),
      ),
    );
  }
}