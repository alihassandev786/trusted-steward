import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/auth%20screens/steward_journey_begins.dart';

import '../dashboard widgets/app_palette.dart';
import '../widgets/app_title.dart';
import '../widgets/app_button.dart';
import '../widgets/app_toggle_tile.dart';

class StayEncouragedScreen extends StatefulWidget {
  /// Called when the user taps Continue, with the final map of
  /// notification preferences. If not provided, this screen just pops.
  final ValueChanged<Map<String, bool>>? onContinue;

  const StayEncouragedScreen({super.key, this.onContinue});

  @override
  State<StayEncouragedScreen> createState() => _StayEncouragedScreenState();
}

class _StayEncouragedScreenState extends State<StayEncouragedScreen> {
  final Map<String, bool> _preferences = {
    'Daily Scripture': true,
    'Task Reminders': true,
    'Learning Notifications': false,
    'General Updates': true,
  };

  final Map<String, IconData> _icons = const {
    'Daily Scripture': Icons.menu_book_outlined,
    'Task Reminders': Icons.check_circle_outline,
    'Learning Notifications': Icons.lightbulb_outline,
    'General Updates': Icons.info_outline,
  };

  final Map<String, String> _descriptions = const {
    'Daily Scripture': 'Morning wisdom & reflection.',
    'Task Reminders': 'Stay on top of stewardship.',
    'Learning Notifications': 'New modules & insights.',
    'General Updates': 'App news & improvements.',
  };

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final keys = _preferences.keys.toList();

    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24, vertical: h * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: h * 0.03),
              const AppTitle(
                title: 'Stay Encouraged!',
                subtitle:
                "Choose how you'd like to receive reminders and scripture.",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: h * 0.04),
              Expanded(
                child: ListView.separated(
                  itemCount: keys.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final key = keys[index];

                    return AppToggleTile(
                      icon: _icons[key]!,
                      title: key,
                      description: _descriptions[key]!,
                      value: _preferences[key]!,
                      onChanged: (value) {
                        setState(() => _preferences[key] = value);
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: h * 0.05),
                child: AppButton(
                  label: 'Continue',
                  onPressed: () {
                    Get.to(()=>StewardshipJourneyBeginsScreen());

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