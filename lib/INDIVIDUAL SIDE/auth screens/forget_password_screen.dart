import 'package:flutter/material.dart';

import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_title.dart';
import '../widgets/auth_bottom_sheet.dart';
import '../widgets/circle_button.dart';
import 'verify_email_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendCode() {
    // TODO: call your API to send the reset code to _emailController.text
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const VerifyEmailScreen()),
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
                    title: 'Forgot Password',
                    subtitle: 'Enter your email to reset your password',
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                    hintText: 'Email Address',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    label: 'Send Code',
                    onPressed: _sendCode,
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