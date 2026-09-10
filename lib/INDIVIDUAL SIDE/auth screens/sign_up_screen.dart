import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/auth%20screens/sign_in_screen.dart';
import 'package:trusted_steward/couple_and_family/presentation/coupleside/otherscreens/couplesetup.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fotherscreens/familysetup.dart';
import '../main_screens/profile_screen_items/privacy_policy_screen.dart';

import '../main_screens/profile_screen_items/terms_condition_screen.dart';
import '../widgets/app_title.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import 'complete_profile_screen.dart';

class SignUpScreen extends StatefulWidget {
  final int selectedId;
  const SignUpScreen({super.key, required this.selectedId});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late final TapGestureRecognizer _termsRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  bool _agreedToTerms = true;

  @override
  void initState() {
    super.initState();

    _termsRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Get.to(() => const TermsConditionsScreen());
      };

    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Get.to(() => const PrivacyPolicyScreen());
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

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFBF6EA),
      body: Stack(
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
                Container(
                  color: Colors.black.withValues(alpha: 0.35),
                ),
              ],
            ),
          ),

          Positioned(
            top: h * 0.38,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
              decoration: const BoxDecoration(
                color: Color(0xFFF6F2E6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppTitle(
                      title: 'Sign Up!',
                      subtitle: 'Enter Details to create your account',
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
                        setState(() {
                          _agreedToTerms = value ?? false;
                        });
                      },
                      label: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 13,
                            fontFamily: 'pop',
                          ),
                          children: [
                            const TextSpan(
                              text: 'I agree with ',
                            ),
                            TextSpan(
                              text: 'terms & conditions',
                              recognizer: _termsRecognizer,
                              style: const TextStyle(
                                color: Color(0xFF306C3F),
                                fontWeight: FontWeight.w600,

                              ),
                            ),
                            const TextSpan(
                              text: ' & ',
                            ),
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

                    AppButton(
                      label: 'Create An Account',
                      onPressed: () {
                        if(widget.selectedId == 0) {
                          Get.to(() => CompleteProfileScreen());
                        } else if(widget.selectedId == 1){
                          Get.to(() => Couplesetup());
                        } else {
                          Get.to(() => Familysetup());
                        }
                      },
                    ),

                    const SizedBox(height: 14),

                    AppTextLinkButton(
                      normalText: 'Already have an account?',
                      linkText: 'Sign In',
                      onPressed: () {
                        Get.to(() =>  SignInScreen(selectedId: widget.selectedId,));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}