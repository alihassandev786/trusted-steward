import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/profile_screen_items/privacy_policy_screen.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/main_screens/profile_screen_items/terms_condition_screen.dart';

import '../../learn_screen_widgets/learn_theme.dart';
import '../../profile_screen_widgets/profile_widgets.dart';
import '../../teasure_dasbord_widgets/detail_screen_header.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({
    super.key,
    this.onContact,
    this.onTerms,
    this.onPrivacyPolicy,
  });

  final VoidCallback? onContact;
  final VoidCallback? onTerms;
  final VoidCallback? onPrivacyPolicy;

  @override
  State<HelpSupportScreen> createState() =>
      _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  String _query = '';

  bool _matches(String title) {
    return title.toLowerCase().contains(_query);
  }

  void _open(VoidCallback? action, String title) {
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
    final hasResults = _matches('Contact Us') ||
        _matches('Terms & Conditions') ||
        _matches('Privacy Policy');

    return Scaffold(
      backgroundColor: learnBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const DetailScreenHeader(
                title: 'Help & Support',
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 34, 20, 30),
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: learnGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/help.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 38),

                    Text(
                      'How Can We Help you?',
                      textAlign: TextAlign.center,
                      style: learnText(
                        16,
                        weight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 22),

                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _query = value.trim().toLowerCase();
                        });
                      },
                      textInputAction: TextInputAction.search,
                      style: learnText(12),
                      decoration: InputDecoration(
                        hintText: 'Search any kind of help you need...',
                        hintStyle: learnText(
                          11,
                          color: Colors.black54,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFECE8D8),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.black45,
                          size: 17,
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 45,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: const BorderSide(
                            color: learnGreen,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 48),

                    if (_matches('Contact Us'))
                      ProfileMenuTile(
                        icon: Icons.contact_phone,
                        title: 'Contact Us',
                        onTap: () => _open(
                          widget.onContact,
                          'Contact Us',
                        ),
                      ),

                    if (_matches('Terms & Conditions'))
                      ProfileMenuTile(
                        icon: Icons.policy_outlined,
                        title: 'Terms & Conditions',
                        onTap: (){Get.to(()=>TermsConditionsScreen());},
                      ),

                    if (_matches('Privacy Policy'))
                      ProfileMenuTile(
                        icon: Icons.privacy_tip_outlined,
                        title: 'Privacy Policy',
                        onTap: (){Get.to(()=>PrivacyPolicyScreen());},
                      ),

                    if (!hasResults)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'No matching help options.',
                          style: learnText(
                            13,
                            color: Colors.black54,
                          ),
                        ),
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