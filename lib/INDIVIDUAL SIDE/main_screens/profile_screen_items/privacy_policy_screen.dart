import 'package:flutter/material.dart';

import '../../learn_screen_widgets/learn_theme.dart';
import '../../teasure_dasbord_widgets/detail_screen_header.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const List<String> _paragraphs = [
    'Welcome to our platform. By accessing or using this application, '
        'you agree to comply with these Terms & Conditions. '
        'Please read them carefully before using our services.',

    'By creating an account or using any part of the platform, '
        'you acknowledge that you have read, understood, '
        'and agreed to these terms.',

    'Users are responsible for providing accurate information, '
        'maintaining the confidentiality of their account credentials, '
        'and using the platform in a lawful manner. '
        'You agree not to misuse the platform, interfere with its '
        'functionality, or engage in activities that may harm other users '
        'or the service. All content, including text, graphics, logos, '
        'icons, and software, is the property of the platform or its '
        'licensors and is protected by applicable intellectual property laws.',

    'We strive to provide reliable services; however, we do not guarantee '
        'uninterrupted or error-free operation. We shall not be liable '
        'for any indirect, incidental, or consequential damages arising '
        'from the use of the platform.',

    'We reserve the right to update or modify these Terms & Conditions '
        'at any time. Continued use of the platform after changes become '
        'effective constitutes acceptance of the revised terms.',

    'If you have any questions regarding these Terms & Conditions, '
        'please contact our support team.',
  ];

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
                title: 'Privacy Policy',
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int index = 0;
                    index < _paragraphs.length;
                    index++) ...[
                      Text(
                        _paragraphs[index],
                        style: learnText(12).copyWith(
                          height: 1.5,
                        ),
                      ),
                      if (index < _paragraphs.length - 1)
                        SizedBox(
                          height: index == 0 ? 32 : 22,
                        ),
                    ],
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