import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/INDIVIDUAL SIDE/auth%20screens/stay_encourage_screen.dart';

import '../dashboard widgets/app_palette.dart';
import '../widgets/app_title.dart';
import '../widgets/app_button.dart';
import '../widgets/app_goal_tile.dart';


class FocusAreaScreen extends StatefulWidget {
  const FocusAreaScreen({super.key});

  @override
  State<FocusAreaScreen> createState() => _FocusAreaScreenState();
}

class _FocusAreaScreenState extends State<FocusAreaScreen> {
  // Single-select: only one goal can be chosen.
  int? _selectedIndex;

  final List<Map<String, dynamic>> _goals = const [
    {'icon': Icons.access_time, 'title': 'Improve Time Management'},
    {'icon': Icons.account_balance_wallet_outlined, 'title': 'Budget Better'},
    {'icon': Icons.spa_outlined, 'title': 'Grow My Talents'},
    {'icon': Icons.menu_book_outlined, 'title': 'Learn More From The Bible'},
    {'icon': Icons.self_improvement, 'title': 'Build Better Habits'},
  ];

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24, vertical: h*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: h * 0.03),
              const AppTitle(
                title: 'What would you like\nto focus on?',
                subtitle: 'Select a goal to guide your daily journey.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: h * 0.04),
              Expanded(
                child: ListView.separated(
                  itemCount: _goals.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final goal = _goals[index];

                    return AppGoalTile(
                      icon: goal['icon'] as IconData,
                      title: goal['title'] as String,
                      selected: _selectedIndex == index,
                      onTap: () => setState(() => _selectedIndex = index),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: h * 0.05),
                child: AppButton(
                  label: 'Continue',
                  onPressed: () {
                    Get.to(() => const StayEncouragedScreen());
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