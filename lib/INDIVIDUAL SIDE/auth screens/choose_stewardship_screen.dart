import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard widgets/app_palette.dart';
import '../widgets/app_title.dart';
import '../widgets/app_button.dart';
import '../widgets/choose_stewared_ship_card.dart';
import 'focus_area_screen.dart';

class ChooseStewardshipPrioritiesScreen extends StatefulWidget {
  const ChooseStewardshipPrioritiesScreen({super.key});

  @override
  State<ChooseStewardshipPrioritiesScreen> createState() =>
      _ChooseStewardshipPrioritiesScreenState();
}

class _ChooseStewardshipPrioritiesScreenState
    extends State<ChooseStewardshipPrioritiesScreen> {
  // Multi-select: more than one priority can be chosen.
  final Set<int> _selectedIndexes = {};

  final List<Map<String, dynamic>> _priorities = const [
    {
      'icon': Icons.access_time,
      'title': 'Time',
      'description': 'Manage your moments faithfully.',
    },
    {
      'icon': Icons.eco_outlined,
      'title': 'Talents',
      'description': "Develop your God-given gifts.",
    },
    {
      'icon': Icons.account_balance_wallet,
      'title': 'Treasure',
      'description': 'Steward your finances with wisdom.',
    },
  ];

  void _toggle(int index) {
    setState(() {
      if (_selectedIndexes.contains(index)) {
        _selectedIndexes.remove(index);
      } else {
        _selectedIndexes.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24, vertical: h*0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: h * 0.03),
              const AppTitle(
                title: 'Choose Stewardship Priorities',
                subtitle:
                'Select the areas you want to\nimprove first. You can select multiple.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: h * 0.06),
              Expanded(
                child: ListView.separated(
                  itemCount: _priorities.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = _priorities[index];

                    return ChooseStewardShipCard(
                      icon: item['icon'] as IconData?,
                      title: item['title'] as String,
                      description: item['description'] as String,
                      selected: _selectedIndexes.contains(index),
                      onTap: () => _toggle(index),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: h * 0.05),
                child: AppButton(
                  label: 'Continue',
                  onPressed: () {
                    Get.to(() => const FocusAreaScreen());
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