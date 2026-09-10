import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/auth%20screens/sign_up_screen.dart';
import 'package:trusted_steward/couple_and_family/presentation/coupleside/bottomnavigationsection/bottomnavigation.dart';
import 'package:trusted_steward/couple_and_family/presentation/familyside/fbottomnavigationsection/fbottomnavigation.dart';

import '../../couple_and_family/data/controllers/bottomnavigationcontroller.dart';
import '../main_screens/main_screen.dart';
import '../widgets/app_title.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import 'forget_password_screen.dart';

class SignInScreen extends StatefulWidget {
  final int selectedId;
  const SignInScreen({super.key, required this.selectedId});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _rememberMe = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFFBF6EA),
      body: Stack(fit: StackFit.expand,
        children: [
          Stack(
          children:[Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: h * 0.7,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/signup.png',
                fit: BoxFit.cover,
              ),
              Container(color: Colors.black.withOpacity(0.35)),
            ],
          ),
        ),
            Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: h * 1.1,
          child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image

            Container(
              color: Colors.black.withOpacity(0.35),
            ),

            // Sign-in card
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: 0.55,
                widthFactor: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFBF6EA),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: SafeArea(
                    top: false,
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: const EdgeInsets.fromLTRB(24, 30, 24, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppTitle(
                            title: 'Sign In!',
                            subtitle: 'Enter your username and password',
                          ),
                          const SizedBox(height: 24),

                          AppTextField(
                            hintText: 'User Name',
                            controller: _usernameController,
                          ),
                          const SizedBox(height: 14),

                          AppTextField(
                            hintText: 'Password',
                            controller: _passwordController,
                            isPassword: true,
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              Expanded(
                                child: AppCheckboxLabel(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value ?? false;
                                    });
                                  },
                                  label: const Text(
                                    'Remember Me',
                                    style: TextStyle(
                                      fontSize: 13,fontFamily: "pop",
                                      color: Color(0xFF1A1A1A),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                 Get.to(()=>ForgotPasswordScreen());
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(fontFamily: "pop",
                                    color: Color(0xFF306C3F),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          AppButton(
                            label: 'Sign In',
                            onPressed: () {
                              if (widget.selectedId == 0) {
                                Get.offAll(() => const MainScreen());
                              } else if (widget.selectedId == 1) {
                                final controller =
                                Get.isRegistered<BottomnavigationController>()
                                    ? Get.find<BottomnavigationController>()
                                    : Get.put(BottomnavigationController());

                                controller.selectedIndex.value = 0;

                                Get.offAll(() => const Bottomnavigation());
                              } else {
                                final controller =
                                Get.isRegistered<BottomnavigationController>()
                                    ? Get.find<BottomnavigationController>()
                                    : Get.put(BottomnavigationController());

                                controller.selectedIndex.value = 0;

                                Get.offAll(() => const Fbottomnavigation());
                              }
                            },
                          ),                          const SizedBox(height: 14),

                          Center(
                            child: AppTextLinkButton(
                              normalText: "Don't have an account?",
                              linkText: 'Sign Up',
                              onPressed: () {
                                Get.to(()=>SignUpScreen(selectedId: widget.selectedId,));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
                ),),
        ])]),
    );
  }
}