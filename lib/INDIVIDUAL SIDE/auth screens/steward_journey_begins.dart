import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../main_screens/main_screen.dart';
import '../widgets/app_button.dart';
import '../widgets/app_title.dart';

class StewardshipJourneyBeginsScreen extends StatelessWidget {


  const StewardshipJourneyBeginsScreen({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF5),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24, vertical: h * 0.12),
          child: Column(
            children: [
              SizedBox(height: h * 0.06),
              // Single pre-composed image (not 3 separate photos).
              Image.asset(
                'assets/images/journey.png',
                height: h * 0.24,
                fit: BoxFit.contain,
              ),
              SizedBox(height: h * 0.06),
              const AppTitle(
                title: 'Stewardship Journey\nBegins!',
                subtitle:
                "Your personalised dashboard is ready.\nLet's manage what God has entrusted to you together.",
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              AppButton(
                label: 'Go to Dashboard',
                onPressed:(){
                  Get.to(()=>MainScreen());
                },
              ),
              SizedBox(height: h * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}