import 'package:flutter/material.dart';


import '../../auth screens/password_change_screen.dart';
import '../../teasure_dasbord_widgets/detail_screen_header.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/app_title.dart';
import '../../widgets/circle_button.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({
    super.key,
    this.onUpdatePassword,
  });

  // Apna password-update API callback yahan connect karein.
  final Future<void> Function(
      String currentPassword,
      String newPassword,
      )? onUpdatePassword;

  @override
  State<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends State<ChangePasswordScreen> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _errorText;
  bool _updating = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _updatePassword() async {
    if (_updating) return;

    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (currentPassword.isEmpty ||
        newPassword.isEmpty ||
        confirmPassword.isEmpty) {
      setState(() {
        _errorText = 'Please fill in all fields';
      });
      return;
    }

    if (newPassword != confirmPassword) {
      setState(() {
        _errorText = 'Passwords do not match';
      });
      return;
    }

    final updatePassword = widget.onUpdatePassword;

    if (updatePassword == null) {
      setState(() {
        _errorText = 'Password update is not connected yet.';
      });
      return;
    }

    FocusScope.of(context).unfocus();

    setState(() {
      _errorText = null;
      _updating = true;
    });

    try {
      await updatePassword(currentPassword, newPassword);

      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const PasswordChangedScreen(),
        ),
      );
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _errorText =
        'Could not update password. Check your current password '
            'and try again.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _updating = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F8F2),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const DetailScreenHeader(
                      title: '',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(
                          20,
                          46,
                          20,
                          40 + bottomInset,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F2E6),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(70),
                          ),
                          border: Border.all(
                            color: Colors.black.withValues(
                              alpha: 0.08,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(
                                alpha: 0.06,
                              ),
                              blurRadius: 5,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: AutofillGroup(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const AppTitle(
                                title: 'Change Password',
                                subtitle:
                                'Create your password to proceed',
                              ),

                              const SizedBox(height: 24),

                              AbsorbPointer(
                                absorbing: _updating,
                                child: Column(
                                  children: [
                                    AppTextField(
                                      hintText: 'Current Password',
                                      controller:
                                      _currentPasswordController,
                                      isPassword: true,
                                    ),

                                    const SizedBox(height: 9),

                                    AppTextField(
                                      hintText: 'New Password',
                                      controller:
                                      _newPasswordController,
                                      isPassword: true,
                                    ),

                                    const SizedBox(height: 9),

                                    AppTextField(
                                      hintText: 'Confirm Password',
                                      controller:
                                      _confirmPasswordController,
                                      isPassword: true,
                                    ),
                                  ],
                                ),
                              ),

                              if (_errorText != null) ...[
                                const SizedBox(height: 12),
                                Text(
                                  _errorText!,
                                  style: const TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 12,
                                    fontFamily: 'Popp',
                                  ),
                                ),
                              ],

                              const SizedBox(height: 34),

                              AppButton(
                                label: _updating
                                    ? 'Updating...'
                                    : 'Update Password',
                                onPressed: _updatePassword,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}