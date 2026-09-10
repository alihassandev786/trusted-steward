import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../auth screens/select_use_screen.dart';
import '../dashboard widgets/app_palette.dart';
import '../widgets/app_button.dart';

/// Welcome Screen - "Welcome To Trusted Steward"
/// Self-contained: logo image, stacked photo collage, title, description
/// and a "Get Started" button — all using local asset images.
///
/// Font rule:
/// - Bold text (the title) uses fontFamily: 'pops'
/// - All other text uses fontFamily: 'pop'
class WelcomeScreen extends StatelessWidget {
  final VoidCallback? onGetStarted;

  const WelcomeScreen({super.key, this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            // Shield logo (asset image)
        Padding(
          padding:  EdgeInsets.only(top: h*0.05,bottom: h*0.05),
          child: Image.asset(
              'assets/images/logo.png',
              height: h*0.12,
              width: w*0.3,
            ),),
            const SizedBox(height: 30),
            // Bottom rounded card containing collage + title + button
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F2E6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 10,
                      offset: const Offset(0, -4), // shadow top par
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                child: Column(
                  children: [
                    // Stacked photo collage
                    Container(width: w * 0.5,height: h*0.2,
                      child: Image.asset("assets/images/welcome.png",
                      fit: BoxFit.contain,),
                    ),
              SizedBox(height: h * 0.08,),
                    // Bold title -> fontFamily 'pops'
                    const Text(
                      'Welcome To\nTrusted Steward',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'pops',
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A1A),
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Description -> fontFamily 'pop'
                    const Text(
                      'Grow spiritually while managing your daily life '
                          'with biblical wisdom.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'pop',
                        fontSize: 14,
                        color: Colors.black,
                        height: 1.4,
                      ),
                    ),
                    const Spacer(),
                    // Get Started button -> fontFamily 'pop' (handled in AppButton)
                    AppButton(
                      label: 'Get Started',
                      onPressed: onGetStarted ?? () {  Get.to(()=>SelectUseScreen());},

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


