import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trusted_steward/CHILD%20SIDE/main_screens/child_dashboard_screen.dart';
import 'package:trusted_steward/CHILD%20SIDE/main_screens/child_learn_screen.dart';
import 'package:trusted_steward/CHILD%20SIDE/main_screens/child_profile_screen.dart';
import 'package:trusted_steward/CHILD%20SIDE/main_screens/my_goals_screen.dart';
import 'package:trusted_steward/CHILD%20SIDE/main_screens/time_dashboard_screen.dart';
import '../../INDIVIDUAL SIDE/widgets/main_controller.dart';

class ChildMainScreen extends StatefulWidget {
  final int initialIndex;
  const ChildMainScreen({super.key, this.initialIndex = 0});

  @override
  State<ChildMainScreen> createState() => _ChildMainScreenState();
}

class _ChildMainScreenState extends State<ChildMainScreen> {
  late final MainScreenController _controller;

  final List<Widget> _screens = [
  ChildDashboardScreen(),
    TasksScreen(),
   MyGoalsScreen(),
    ChildLearnScreen(),
    ChildProfileScreen(),
  ];

  final List<IconData> _navIcons = const [
    Icons.home_rounded,
    Icons.task_alt,
    Icons.savings_outlined,
    Icons.menu_book_outlined,
    Icons.person_rounded,
  ];

  // 🔧 Fixed logical height of the nav bar's actual content (icons row),
  // NOT counting the device's bottom safe-area/home-indicator. Keeping
  // this constant (instead of a % of screen height) is what makes the
  // bar look the same size on a small and a large phone alike, and on
  // both iOS and Android.
  static const double _navContentHeight = 55;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(MainScreenController());
    _controller.changeTab(widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    // 📐 Bottom safe-area inset: ~34 on iPhones with a home indicator,
    // varies on Android (0 for 3-button nav, ~16-48 for gesture nav).
    // Adding this on top of a fixed content height means the tappable
    // icon row is always the same size across devices, while the extra
    // system-reserved space below it is only as tall as each device
    // actually needs — no more guessing with a % of screen height.
    final double bottomInset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      // 🔑 IndexedStack ko Obx ke bahar nikal diya — yeh screens tab
      // switch hone par khud-ba-khud rebuild nahi karenge, sirf index
      // change hoga. Poora Scaffold rebuild karne ki zaroorat nahi.
      body: Obx(
            () => IndexedStack(
          index: _controller.currentIndex.value,
          children: _screens,
        ),
      ),
      bottomNavigationBar: Container(
        height: _navContentHeight + bottomInset,
        padding: EdgeInsets.only(bottom: bottomInset),
        decoration: const BoxDecoration(
          color: Colors.white, // dark bar bg
        ),
        // 🔑 Sirf nav bar ka Row Obx ke andar hai — is se sirf icons
        // ka selected/unselected state update hota hai, screens nahi.
        child: Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_navIcons.length, (index) {
              final bool isSelected =
                  index == _controller.currentIndex.value;
              final bool isCenterButton = index == 2; // the "+" icon

              final Widget icon = Icon(
                _navIcons[index],
                size: isCenterButton ? 24 : 24,
                color: isSelected ? Colors.white : Color(0xff9C9C9C99),
              );

              return GestureDetector(
                onTap: () => _controller.changeTab(index),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: isSelected
                      ? ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color(0xff306C3F),
                        Color(0xff306C3F),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: icon,
                  )
                      : icon,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}