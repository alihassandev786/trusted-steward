import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/couple_and_family/presentation/coupleside/otherscreens/couplesetup.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fotherscreens/familysetup.dart';

import '../../Auth_services/signup_service.dart';
import '../main_screens/profile_screen_items/privacy_policy_screen.dart';
import '../main_screens/profile_screen_items/terms_condition_screen.dart';
import '../widgets/app_button.dart';
import '../widgets/app_helper.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_title.dart';
import 'complete_profile_screen.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.selectedId});

  final int selectedId;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpService _authService = SignUpService();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late final TapGestureRecognizer _termsRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  bool _agreedToTerms = false;
  bool _isSubmitting = false;
  bool _accountCreated = false;

  // A client-side policy, not a rule confirmed by the supplied API example.
  static const int _minimumPasswordLength = 8;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()
      ..onTap = () {
        if (!_isSubmitting) Get.to(() => const TermsConditionsScreen());
      };
    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () {
        if (!_isSubmitting) Get.to(() => const PrivacyPolicyScreen());
      };
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validationError() {
    if (SignUpService.roleForSelection(widget.selectedId) == null) {
      return 'Please go back and select a valid account type.';
    }
    if (_nameController.text.trim().isEmpty) {
      return 'Please enter your full name.';
    }

    final email = _emailController.text.trim();
    if (email.isEmpty) return 'Please enter your email address.';
    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email)) {
      return 'Please enter a valid email address.';
    }

    final password = _passwordController.text;
    if (password.trim().isEmpty) return 'Please create a password.';
    if (password.length < _minimumPasswordLength) {
      return 'Password must be at least $_minimumPasswordLength characters long.';
    }
    if (_confirmPasswordController.text.isEmpty) {
      return 'Please confirm your password.';
    }
    if (password != _confirmPasswordController.text) {
      return 'Passwords do not match. Please try again.';
    }
    if (!_agreedToTerms) {
      return 'Please agree to the terms and conditions and privacy policy.';
    }
    return null;
  }

  Future<void> _createAccount() async {
    if (_isSubmitting || _accountCreated) return;
    FocusScope.of(context).unfocus();

    final validationError = _validationError();
    if (validationError != null) {
      AppHelpers.showError(validationError, title: 'Check Your Details');
      return;
    }

    final role = SignUpService.roleForSelection(widget.selectedId)!;
    setState(() => _isSubmitting = true);

    SignUpResult? result;
    String? errorMessage;
    var openedLoader = false;
    var serverConfirmedCreation = false;

    try {
      openedLoader = AppHelpers.showLoader();
      if (!openedLoader) return;

      result = await _authService.signUp(
        fullName: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        role: role,
      );
    } on SignUpException catch (error) {
      errorMessage = error.message;
      serverConfirmedCreation = error.accountCreated;
    } catch (_) {
      // Keep raw exceptions and request contents out of the UI and logs.
      errorMessage = 'We could not confirm sign-up. Please try signing in '
          'before trying again. If the problem continues, contact support.';
    } finally {
      // Close the loader before showing a snackbar or changing screens.
      if (openedLoader) AppHelpers.hideLoader();
      if (mounted) {
        setState(() {
          _isSubmitting = false;
          _accountCreated = result != null || serverConfirmedCreation;
        });
      }
    }

    if (!mounted) return;
    if (_accountCreated) {
      _passwordController.clear();
      _confirmPasswordController.clear();
    }
    if (errorMessage != null) {
      AppHelpers.showError(errorMessage, title: 'Sign Up Failed');
      return;
    }

    final completedSignUp = result;
    if (completedSignUp == null) return;

    _openSetup(completedSignUp.user);

    // Show success after the new route has had a chance to build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppHelpers.showSuccess(completedSignUp.message);
    });
  }

  void _openSetup(SignUpUser user) {
    // The existing setup constructors remain unchanged. Read these values
    // with Get.arguments in a setup screen when its API needs the user ID.
    final arguments = <String, dynamic>{
      ...user.toJson(),
      'selectedId': widget.selectedId,
    };

    switch (widget.selectedId) {
      case 0:
        Get.off(() => CompleteProfileScreen(), arguments: arguments);
        break;
      case 1:
        Get.off(() => Couplesetup(), arguments: arguments);
        break;
      case 2:
        Get.off(() => Familysetup(), arguments: arguments);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;

    return PopScope(
      canPop: !_isSubmitting,
      child: Scaffold(
        backgroundColor: const Color(0xFFFBF6EA),
        body: AbsorbPointer(
          absorbing: _isSubmitting,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Let the complete form scroll when the keyboard is visible.
              final topSpace = h * 0.38;
              final panelMinHeight =
              (constraints.maxHeight - topSpace).clamp(0.0, h).toDouble();

              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: h * 0.45,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/signup.png',
                          fit: BoxFit.cover,
                        ),
                        Container(color: Colors.black.withValues(alpha: 0.35)),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Padding(
                      padding: EdgeInsets.only(top: topSpace),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(minHeight: panelMinHeight),
                        padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF6F2E6),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                        ),
                        child: SafeArea(
                          top: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppTitle(
                                title: 'Sign Up!',
                                subtitle: 'Enter details to create your account',
                              ),
                              const SizedBox(height: 24),
                              AppTextField(
                                hintText: 'Full Name',
                                controller: _nameController,
                              ),
                              const SizedBox(height: 14),
                              AppTextField(
                                hintText: 'Email Address',
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 14),
                              AppTextField(
                                hintText: 'Create Password',
                                controller: _passwordController,
                                isPassword: true,
                              ),
                              const SizedBox(height: 14),
                              AppTextField(
                                hintText: 'Confirm Password',
                                controller: _confirmPasswordController,
                                isPassword: true,
                              ),
                              const SizedBox(height: 18),
                              AppCheckboxLabel(
                                value: _agreedToTerms,
                                onChanged: (value) {
                                  setState(() => _agreedToTerms = value ?? false);
                                },
                                label: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Color(0xFF1A1A1A),
                                      fontSize: 13,
                                      fontFamily: 'pop',
                                    ),
                                    children: [
                                      const TextSpan(text: 'I agree with '),
                                      TextSpan(
                                        text: 'terms & conditions',
                                        recognizer: _termsRecognizer,
                                        style: const TextStyle(
                                          color: Color(0xFF306C3F),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const TextSpan(text: ' & '),
                                      TextSpan(
                                        text: 'privacy policy',
                                        recognizer: _privacyRecognizer,
                                        style: const TextStyle(
                                          color: Color(0xFF306C3F),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              IgnorePointer(
                                ignoring: _isSubmitting || _accountCreated,
                                child: AppButton(
                                  label: _isSubmitting
                                      ? 'Creating Account...'
                                      : _accountCreated
                                      ? 'Account Created'
                                      : 'Create An Account',
                                  onPressed: _createAccount,
                                ),
                              ),
                              const SizedBox(height: 14),
                              AppTextLinkButton(
                                normalText: 'Already have an account?',
                                linkText: 'Sign In',
                                onPressed: () {
                                  if (_isSubmitting) return;
                                  Get.to(
                                        () => SignInScreen(
                                      selectedId: widget.selectedId,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
