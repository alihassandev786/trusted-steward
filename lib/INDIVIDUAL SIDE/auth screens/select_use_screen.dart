import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/auth%20screens/sign_in_screen.dart';

import '../dashboard widgets/app_palette.dart';
import '../widgets/app_title.dart';
import '../widgets/app_button.dart';
import '../widgets/app_option_card.dart';

class SelectUseScreen extends StatefulWidget {
  const SelectUseScreen({super.key});

  @override
  State<SelectUseScreen> createState() => _SelectUseScreenState();
}

class _SelectUseScreenState extends State<SelectUseScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _options = [
    {
      'icon': Icons.person,
      'title': 'Individual',
      'description':
      'Manage your own stewardship journey with personal insights and goals.',
    },
    {
      'assetImage': 'assets/images/couple.png',
      'title': 'Couple',
      'description':
      'Manage selected areas of stewardship together with your spouse.',
    },
    {
      'assetImage': 'assets/images/family.png',
      'title': 'Family',
      'description':
      'Manage your household finances, family goals and foster stewardship.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: h * 0.04),
              const AppTitle(
                title: 'Select Your Use!',
                subtitle:
                'Select the account type that best\ndescribes your stewardship journey.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: h * 0.05),
              Expanded(
                child: ListView.separated(
                  itemCount: _options.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final option = _options[index];

                    return AppOptionCard(
                      icon: option['icon'] as IconData?,
                      assetImage: option['assetImage'] as String?,
                      title: option['title'] as String,
                      description: option['description'] as String,
                      selected: _selectedIndex == index,
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: h * 0.1),
                child: AppButton(
                  label: 'Continue',
                  onPressed: () {
                    Get.to(()=>SignInScreen(selectedId: _selectedIndex,));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}