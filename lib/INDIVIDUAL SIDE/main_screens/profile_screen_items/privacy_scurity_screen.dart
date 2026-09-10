import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/profile_screen_items/privacy_policy_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/profile_screen_items/terms_condition_screen.dart';


import '../../learn_screen_widgets/learn_theme.dart';
import '../../profile_screen_widgets/profile_widgets.dart';
import '../../teasure_dasbord_widgets/detail_screen_header.dart';
import 'change_password_screen.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({
    super.key,
    this.onChangePassword,
    this.onTerms,
    this.onPrivacyPolicy,
  });

  final VoidCallback? onChangePassword;
  final VoidCallback? onTerms;
  final VoidCallback? onPrivacyPolicy;

  void _open(
      BuildContext context,
      VoidCallback? action,
      String title,
      ) {
    if (action != null) {
      action();
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$title is not available yet.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const DetailScreenHeader(
                title: 'Privacy & Security',
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 46, 20, 30),
                child: Column(
                  children: [
                    ProfileMenuTile(
                      icon: Icons.lock,
                      title: 'Change Password',
                      onTap: (){Get.to(()=>ChangePasswordScreen());},
                      ),

                    ProfileMenuTile(
                      icon: Icons.policy_outlined,
                      title: 'Terms & Conditions',
                       onTap: (){Get.to(()=>TermsConditionsScreen());},
                    ),
                    ProfileMenuTile(
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy Policy',
                      onTap: (){Get.to(()=>PrivacyPolicyScreen());},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}