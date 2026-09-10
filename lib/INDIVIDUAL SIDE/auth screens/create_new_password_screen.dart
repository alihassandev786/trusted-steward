import 'package:flutter/material.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/auth%20screens/password_change_screen.dart';

import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_title.dart';
import '../widgets/auth_bottom_sheet.dart';
import '../widgets/circle_button.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (_newPasswordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      setState(() => _errorText = 'Please fill in both fields');
      return;
    }
    if (_newPasswordController.text != _confirmPasswordController.text) {
      setState(() => _errorText = 'Passwords do not match');
      return;
    }

    setState(() => _errorText = null);

    // TODO: call your API to set the new password
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const PasswordChangedScreen()),
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
                    title: 'Create New Password',
                    subtitle: 'Create your password to proceed',
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                    hintText: 'New Password',
                    controller: _newPasswordController,
                    isPassword: true,
                  ),
                  const SizedBox(height: 14),
                  AppTextField(
                    hintText: 'Confirm Password',
                    controller: _confirmPasswordController,
                    isPassword: true,
                  ),
                  if (_errorText != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      _errorText!,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 13,
                        fontFamily: 'pop',
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  AppButton(
                    label: 'Reset Password',
                    onPressed: _resetPassword,
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