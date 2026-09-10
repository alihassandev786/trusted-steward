import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/auth%20screens/sign_in_screen.dart';
import 'package:trusted_steward/INDIVIDUAL%20SIDE/auth%20screens/select_use_screen.dart';

import '../widgets/app_button.dart';

class PasswordChangedScreen extends StatelessWidget {
  /// Called when the user taps "Login Now". If not provided, this screen
  /// just pops all the way back to the first route.
  final VoidCallback? onLoginNow;

  const PasswordChangedScreen({super.key, this.onLoginNow});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF5),
      body: Stack(
        children: [
          // Confetti / popper effect image across the top of the screen.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/pop.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    'Password Changed!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'pops',
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'You have successfully created a new password.\n'
                        'login with your new password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'pop',
                      color: Colors.black,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 32),
                  AppButton(
                    label: 'Login Now',
                    onPressed: () {
                      if (onLoginNow != null) {
                        onLoginNow!();
                      } else {
                        Get.to(()=>SelectUseScreen());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}